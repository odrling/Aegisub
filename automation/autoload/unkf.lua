local tr = aegisub.gettext

script_name = tr"unkf"
script_description = tr"replace kf/ko tags in selected lines by regular k tags"
script_author = "amoethyst"
script_version = "1.0"


function split_line(subs, sel)
    local expr_kof = "^(.-{[^}]*\\k)[of](.*)$"
    local expr_K = "^(.-{[^}]*\\)K(.*)$"
    local before, after

    for _, i in ipairs(sel) do
        line = subs[i]

        -- replace ko and kf tags
        while true do
            before, after = line.text:match(expr_kof)
            if before == nil then
                break
            else
                line.text = before .. after
            end
        end

        -- replace K tags
        while true do
            before, after = line.text:match(expr_K)
            if before == nil then
                break
            else
                line.text = before .. "k" .. after
            end
        end

        subs[i] = line
    end

    aegisub.set_undo_point(script_name)
end

aegisub.register_macro(script_name, script_description, split_line)
