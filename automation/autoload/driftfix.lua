local tr = aegisub.gettext

script_name = tr"driftfix"
script_description = tr"shift drifting lines"
script_author = "amoethyst"
script_version = "1.0"


function split_line(subs, sel)
    local step = -200 -- drift step in milliseconds
    local drift = step

    for _, i in ipairs(sel) do
        line = subs[i]

        line.start_time = line.start_time + drift
        line.end_time = line.end_time + drift
        drift = drift + step

        subs[i] = line
    end

    aegisub.set_undo_point(script_name)
end

aegisub.register_macro(script_name, script_description, split_line)
