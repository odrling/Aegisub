local tr = aegisub.gettext

script_name = tr"Karaoke 1sec adjust lead-in"
script_description = tr"Adjust karaoke leadin to 1sec"
script_author = "Flore"
script_version = "1.00"

include("cleantags.lua")

leadinmsec = 1000 --lead in time can be changed here

ktag = "\\[kK][fo]?%d+" --pattern used to detect karaoke tags

-- KM template line definition
km_template_effect = "template pre-line all keeptags"
km_template_text = '!retime("line",$start < 900 and -$start or -900,200)!{!$start < 900 and "\\\\k" .. ($start/10) or "\\\\k90"!\\fad(!$start < 900 and $start or 300!,200)}'

function hasleadin(line)--check if there is an existing lead in (2 consecutive bracket with karaoke tags at the start of the line)
        return line.text:find("^{[^{}]-" .. ktag .. "[^{}]-}%s*{[^{}]-" .. ktag .. "[^{}]-}")
end


function removeleadin(line)
    if not hasleadin(line) then
        return line
    end

    leadin = tonumber( line.text:match("^{[^{}]-\\[kK][fo]?(%d+)[^{}]-}%s*{[^{}]-" .. ktag .. "[^{}]-}") ) --read lead-in value
    line.text = line.text:gsub("^({[^{}]-)\\[kK][fo]?%d+(.-}%s*{[^{}]-" .. ktag .. ".-})","%1%2")  --remove lead in

    line.text = cleantags(line.text) --clean tags

    line.start_time = line.start_time +  leadin*10 --adjust start time

    --aegisub.log(line.text)

    return line
end


function adjust_1sec(subs, sel)

    for _, i in ipairs(sel) do
        local line = subs[i]

        line.text = cleantags(line.text)

        if( line.text:find(ktag)) then--don't do anything if there is no ktags in this line

            --start by removing existing lead-in
            while hasleadin(line) do
                    if aegisub.progress.is_cancelled() then return end
                    line = removeleadin(line)
            end

            --then add our lead in

            if line.start_time >= leadinmsec then
                    line.text = string.format("{\\k%d}%s",leadinmsec/10, line.text)
                    line.start_time = line.start_time - leadinmsec

            else --if line starts too early to put the needed lead in, make the line start at time 0 and fill with appropriate lead in
                    line.text = string.format("{\\k%d}%s",line.start_time/10, line.text)
                    line.start_time = 0
            end

            subs[i] = line
        end
    end

    aegisub.set_undo_point(tr"1sec adjust lead-in")
end


function remove_tag(line, tag)
    local expr = "^(.-{[^}]*)\\" .. tag .. "[^\\}]*(.*)"
    while true do
        before, after = line.text:match(expr)
        if before == nil then
            return line
        else
            line.text = cleantags(before .. after)
        end
    end
end


function is_template_line(line)
    return (line.class == "dialogue"
        and line.effect == km_template_effect
        and line.text == km_template_text)
end


function mugenizer(subs)
    local first = nil
    local styles_different = false
    local styles = 0
    local i_styles = {}
    local template_present = false

    for i, line in ipairs(subs) do
        if line.class == "info" then
            if line.key == "PlayResX" or line.key == "PlayResY" then
                line.value = "0"
            end
        end

        if line.class == "style" then
            line.fontname = "Arial"
            line.fontsize = "24"
            line.outline = "1.5"
            line.shadow = "0"
            line.margin_l = "15"
            line.margin_r = "15"
            line.margin_t = "20"
            line.margin_b = "20"

            i_styles[styles] = i
            if styles > 0 then
                styles_different = styles_different or line.color1 ~= subs[i_styles[styles-1]].color1 or line.color2 ~= subs[i_styles[styles-1]].color2 or line.color3 ~= subs[i_styles[styles-1]].color3 or line.color4 ~= subs[i_styles[styles-1]].color4
            end
            styles = styles + 1
        end

        if is_template_line(line) then
            line.comment = true
            template_present = true
        end

        if line.class == "dialogue" and not line.comment and line.effect ~= "fx" then
            if first == nil then
                first = i
            end

            line.text = cleantags(line.text)

            while hasleadin(line) do
                if aegisub.progress.is_cancelled() then return end
                line = removeleadin(line)
            end

            line = remove_tag(line, "fad")
        end

        subs[i] = line
    end

    if not styles_different then
        for i = 0, styles-1, 1 do
            line = subs[i_styles[i]]
            line.color1 = "&H008AFF"
            line.color2 = "&HFFFFFF"
            line.color3 = "&H000000"
            line.color4 = "&H000000"
            subs[i_styles[i]] = line
        end
    end

    if not template_present then
        -- add mugen's magic line
        line = subs[first]
        line.comment = true
        line.start_time = 0
        line.end_time = 0
        line.effect = km_template_effect
        line.text = km_template_text
        subs.insert(first, line)
    end
end

aegisub.register_macro(script_name, script_description, adjust_1sec)
aegisub.register_macro(tr"Mugenizer", tr"Mugenize your subs", mugenizer)
