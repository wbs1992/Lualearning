function getvarvalue(...)
    local co = ...
    if type(co) == "thread" then
        local name, level, isenv = select(2,...)
        local value
        local found = false
        level = level or 1
        for i=1, math.huge do
            local n,v = debug.getlocal(co,level,i)
            if not n then
                break
            end
            if n == name then
                value = v
                found = true
            end
        end
        if found then return "local", value end

        local func = debug.getinfo(co, level, "f").func
        for i=1, math.huge do
            local n,v = debug.getupvalue(func, i)
            if not n then
                break
            end
            if n == name then
                return "upvalue", v
            end
        end
        if isenv then
            return "noenv"
        end

        local _, env = getvarvalue("_ENV", level, true)
        if env then
            return "global", env[name]
        else 
            return "noenv"
        end
    else
        local name, level, isenv = ...
        local value
        local found = false
        level = (level or 1)+1
        for i=1, math.huge do
            local n,v = debug.getlocal(level,i)
            if not n then
                break
            end
            if n == name then
                value = v
                found = true
            end
        end
        if found then return "local", value end

        local func = debug.getinfo(level, "f").func
        for i=1, math.huge do
            local n,v = debug.getupvalue(func, i)
            if not n then
                break
            end
            if n == name then
                return "upvalue", v
            end
        end
        if isenv then
            return "noenv"
        end

        local _, env = getvarvalue("_ENV", level, true)
        if env then
            return "global", env[name]
        else 
            return "noenv"
        end
    end
end