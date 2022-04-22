local tr = aegisub.gettext

script_name = tr"Nihongo wa muzukashii"
script_description = tr"Turn your \"o e\"s into \"wo he\"s"
script_author = "amoethyst"
script_version = "1.0"

function wohe(subs, sel)

    -- "Unfortunately Lua patterns do not support this, only single characters can be repeated or chosen between, not sub-patterns or strings"
    -- well, fuck
    local exprs = {
        "^(.* {[^}]*})([oe])({[^}]*} .*)$",
        "^(.* )([oe])({[^}]*} .*)$",
        "^(.* {[^}]*})([oe])( .*)$",
        "^(.* )([oe])( .*)$",
        "^()([oe])( .*)$",
    }

    for _, i in ipairs(sel) do
        line = subs[i]
        line.text = line.text .. " "

        for _, expr in ipairs(exprs) do
            local before, o_or_e, after = line.text:match(expr)
            while o_or_e ~= nil do
                line.text = ""

                if before ~= nil then
                    line.text = before
                end

                if o_or_e == "o" then
                    line.text = line.text .. "wo"
                else
                    line.text = line.text .. "he"
                end

                if after ~= nil then
                    line.text = line.text .. after
                end

                before, o_or_e, after = line.text:match(expr)
            end
        end

        line.text = line.text:gsub(" $", "")

        subs[i] = line

    end

end

aegisub.register_macro(script_name, script_description, wohe)
