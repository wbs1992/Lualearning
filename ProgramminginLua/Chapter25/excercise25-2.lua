function setvarvalue(name, level, isenv, value)
    local found = false
    level = (level or 1)+1
    for i=1, math.huge do
        local n,v = debug.getlocal(level,i)
        if not n then
            break
        end
        if n == name then
            debug.setlocal(level, i, value)
            found = true
        end
    end
    if found then return "local" end

    local func = debug.getinfo(level, "f").func
    for i=1, math.huge do
        local n,v = debug.getupvalue(func, i)
        if not n then
            break
        end
        if n == name then
            debug.setupvalue( func, i, value )
            return "upvalue"
        end
    end
    if isenv then
        return "noenv"
    end

    local _, env = getvarvalue("_ENV", level, true)
    if env then
        env[name] = value
        return "global"
    else 
        return "noenv"
    end

end