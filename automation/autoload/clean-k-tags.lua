local tr = aegisub.gettext

script_name = tr"Clean k tags"
script_description = tr"Remove double k tags"
script_author = "amoethyst"
script_version = "1.0"

function special_k(subs, sel)

    -- if the first tag is K/kf this would break the timing for the previous timing
    local expr = "^(.-){\\(ko?)([0-9.]*)[^}]-}([^{]-){\\[kK][fo]?([0-9.]*)[^}]-}( -{(\\[kK][fo]?)[0-9.]*[^}]-}.*)$"

    for _, i in ipairs(sel) do
        line = subs[i]
        before, tag, k1, between, k2, after = line.text:match(expr)
        while after ~= nil do
            line.text = before .. "{\\" .. tag .. tonumber(k1) + tonumber(k2) .. "}" .. between .. after
            subs[i] = line
            before, tag, k1, between, k2, after = line.text:match(expr)
        end
    end

end

aegisub.register_macro(script_name, script_description, special_k)
