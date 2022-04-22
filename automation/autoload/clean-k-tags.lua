local tr = aegisub.gettext

script_name = tr"Clean k tags"
script_description = tr"Remove double k tags"
script_author = "amoethyst"
script_version = "1.0"

local double_k = "^(.-{\\k[^}]-)(\\k.+)$"
-- if the first tag is K/kf this would break the timing for the previous timing
local expr = "^(.-){\\(ko?)([0-9.]+)[^}]-}([^{]-){\\[kK][fo]?([0-9.]+)[^}]-}( -{(\\[kK][fo]?)[0-9.]+[^}]-}.*)$"


function _special_k(subs, i)
    line = subs[i]

    before, after = line.text:match(double_k)
    while after ~= nil do
        line.text = before .. "}{" .. after
        before, after = line.text:match(double_k)
    end

    before, tag, k1, between, k2, after = line.text:match(expr)
    while after ~= nil do
        line.text = before .. "{\\" .. tag .. tonumber(k1) + tonumber(k2) .. "}" .. between .. after
        before, tag, k1, between, k2, after = line.text:match(expr)
    end

    return line
end


function special_k(subs, sel)

    for _, i in ipairs(sel) do
        ok, res = pcall(_special_k, subs, i)
        if ok then
            subs[i] = res
        else
            aegisub.log("error on line " .. i .. ": " .. line.text .. "\n")
            aegisub.log(res .. "\n")
        end
    end

end

aegisub.register_macro(script_name, script_description, special_k)
