local tr = aegisub.gettext

script_name = tr"Duetto Meika"
script_description = tr"The ultimate tool for karaoke duets"
script_author = "amoethyst"

include("utils.lua")


function replace_style(line, style_name, style_string)
    before_style, after_style = line.text:match("^(.-{[^}]-)\\?s:".. style_name .."(.*)$")
    return before_style .. style_string .. after_style
end


function duetto(subs, sel)
    styles = {}

    -- create the style map
    for _, line in ipairs(subs) do
        if line.class == "style" then
            styles[line.name] = line
        end
    end

    -- duetto~
    for _, i in ipairs(sel) do
        line = subs[i]

        current_style = styles[line.style]
        -- match every `s:` marker
        for style_name in line.text:gmatch("{[^}]*s:([^}\\]*)[^}]*}") do
            if style_name ~= current_style.name then

                style = styles[style_name]
                -- build the tags to use the new style
                style_string = ""
                if current_style.color1 ~= style.color1 then
                    style_string = style_string .. "\\c" .. style.color1
                end
                if current_style.color2 ~= style.color2 then
                    style_string = style_string .. "\\2c" .. style.color2
                end
                if current_style.color3 ~= style.color3 then
                    style_string = style_string .. "\\3c" .. style.color3
                end
                if current_style.color4 ~= style.color4 then
                    style_string = style_string .. "\\4c" .. style.color4
                end

                -- set style
                line.text = replace_style(line, style_name, style_string)
                current_style = style
            else
                -- remove marker to not break everything
                line.text = replace_style(line, style_name, "")
            end
        end
        subs[i] = line
    end

    aegisub.set_undo_point(script_name)
end


function test_colors(c1, c2)
    return color_from_style(c1) == color_from_style(c2)
end


function get_script_style(style, styles)
    for key, script_style in pairs(styles) do
        if (test_colors(style.color1, script_style.color1)
                and test_colors(style.color2, script_style.color2)
                and test_colors(style.color3, script_style.color3)
                and test_colors(style.color4, script_style.color4)
                and tonumber(style.fontsize) == tonumber(script_style.fontsize)
                and style.fontname == script_style.fontname) then
            return script_style
        end
    end
    return nil
end


function deduetto_meika(subs, sel)
    local styles = {}
    local last_style = -1

    -- create the style map
    for i, line in ipairs(subs) do
        if line.class == "style" then
            styles[line.name] = line
            last_style = i
        end
    end

    local new_styles = {}

    for _, i in ipairs(sel) do
        local line = subs[i]
        local current_style = table.copy(styles[line.style])

        local search_index = 1
        while search_index < #line.text do
            local match_start, match_end = line.text:find("{[^}]*}", search_index)
            if match_start == nil then
                break
            end

            local bracketed = line.text:sub(match_start, match_end)
            local new_style = false

            -- change style's colors
            for tag, value in bracketed:gmatch("\\([1-4]?c)([^}\\]*)") do
                new_style = true
                if tag == "c" or tag == "1c" then
                    current_style.color1 = value
                elseif tag == "2c" then
                    current_style.color2 = value
                elseif tag == "3c" then
                    current_style.color3 = value
                elseif tag == "4c" then
                    current_style.color4 = value
                end
            end

            -- change style's font
            for tag, value in bracketed:gmatch("\\(f[sn])([^}\\]*)") do
                new_style = true
                if tag == "fs" then
                    current_style.fontsize = value
                elseif tag == "fn" then
                    current_style.fontname = value
                end
            end

            if new_style then
                local script_style = get_script_style(current_style, styles)
                if script_style == nil then
                    if get_script_style(current_style, new_styles) == nil then
                        new_styles[#new_styles+1] = table.copy(current_style)
                    end
                else
                    -- remove inline colors
                    bracketed = bracketed:gsub("\\[1-4]?c[^\\}]*", "")
                    bracketed = bracketed:gsub("\\[1-4]?a[^\\}]*", "")
                    -- remove inline fonts
                    bracketed = bracketed:gsub("\\f[sn][^\\}]*", "")

                    -- add style marker
                    bracketed = "{s:" .. script_style.name .. bracketed:sub(2, #bracketed)
                    line.text = line.text:sub(1, match_start-1) .. bracketed ..  line.text:sub(match_end + 1, #line.text)
                end
            end

            search_index = match_start + 1
        end

        subs[i] = line
    end

    if #new_styles > 0 then
        for i, new_style in ipairs(new_styles) do
            new_style.name = "Deduetto style " .. i
            subs.insert(last_style, new_style)
            last_style = last_style + 1
            aegisub.log("Created new style: " .. new_style.name .. "\n")
        end
    end

end

aegisub.register_macro(script_name, script_description, duetto)
aegisub.register_macro(tr"Deduetto Meika", tr"Create styles from inline color tags", deduetto_meika)
