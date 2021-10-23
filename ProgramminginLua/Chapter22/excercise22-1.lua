function getfield(f)
    local v = _G
    w = string.match(f, "[^%w._]")
    if w then
        error("seperation character war wrong!")
    end
    for w,d in string.match(f, "([%a_][%b_]*)([%.?]") do
            v = v[w]
    end
    return v
end