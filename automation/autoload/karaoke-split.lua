local tr = aegisub.gettext

script_name = tr"Split karaoke line"
script_description = tr"Split line at {split} marker according to ktags"
script_author = "amoethyst"
script_version = "1.0"

function split_line(subs, sel)

    function getduration(line)
        d = 0

        kduration = "{[^}]-\\[kK][fo]?(%d+)[^}]-}"
        for match in line:gmatch(kduration) do
            d = d + tonumber(match)
        end

        return d * 10
    end

    insertions = 0
    for _, i in ipairs(sel) do
        i = i + insertions
        line1 = subs[i]
        line2 = subs[i]

        split_expr = "(.-)%s*{split}%s*(.*)"
        line1.text, line2.text = line1.text:match(split_expr)

        while line1.text ~= nil do
            line1.end_time = line1.start_time + getduration(line1.text)
            line2.start_time = line1.end_time

            subs[i] = line1
            i = i + 1
            insertions = insertions + 1
            subs.insert(i, line2)
            line1 = subs[i]

            line1.text, line2.text = line1.text:match(split_expr)
        end

    end

    aegisub.set_undo_point(tr"Karaoke split")
end

aegisub.register_macro(script_name, script_description, split_line)
