local tr = aegisub.gettext

script_name = tr"kf"
script_description = tr"add kf tag for 'long' syllables"
script_author = "amoethyst"
script_version = "1.0"


function split_line(subs, sel)
    local expr_k = "(.-{[^}]*\\)[kK][of]?(%d+)([^{]*)"
    local before, after, dur, text

    for _, i in ipairs(sel) do
        line = subs[i]

        -- replace k tags
        text = ""
        for before, dur, after in line.text:gmatch(expr_k) do
            if before == nil then
                break
            else
                if tonumber(dur) >= 90 then
                    text = text .. before .. "kf" .. dur .. after
                else
                    text = text .. before .. "k" .. dur .. after
                end
            end
        end

        if text ~= "" then
            line.text = text
            subs[i] = line
        end
    end

    aegisub.set_undo_point(script_name)
end

aegisub.register_macro(script_name, script_description, split_line)
