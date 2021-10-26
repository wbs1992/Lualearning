function getvarvalue(_, name, level, isnev)
    local value
    local found = false
    level = (level or 3)+1
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
    if found then return value end

    local func = debug.getinfo(level, "f").func
    for i=1, math.huge do
        local n,v = debug.getupvalue(func, i)
        if not n then
            break
        end
        if n == name then
            return  v
        end
    end
    if isenv then
        return "noenv"
    end

    local env = getvarvalue(nil, "_ENV", level, true)
    if env then
        return env[name]
    else 
        return "noenv"
    end
end

function setvarvalue(name, level, isenv, value)
    local found = false
    level = (level or 3)+1
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

function debug1()
    while true do
        io.write("debug> ")
        local line = io.read()
        if line == "cont" then
            break
        end
        local env={print=print, __index=getvarvalue, __newindex = setvarvalue}
        setmetatable(env, env)
        load(line, "testcode", "t", env)()
    end
end