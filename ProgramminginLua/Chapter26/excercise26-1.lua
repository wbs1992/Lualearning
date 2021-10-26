local socket = require"socket"
function download(host, file)
    local c = assert(socket.connect(host, 80))
    local count = 0
    local request = string.format("GET %s HTTP/1.0\r\nhost: %s\r\n\r\n", file, host)
    c:send(request)

    while true do
        local s, status = receive(c)
        count = count+#s
        if status == "closed" then break end
    end

    c:close()
    print(file, count)
end

function receive(connection)
    connection:settimeout(0)
    local s, status, partial = connection:receive(2^18)
    if status =="timeout" then 
        coroutine.yield(connection)
    end
    return s or partial, status
end

tasks = {}

function get(host,file)
    local co = coroutine.wrap( function() download(host, file) end )
    table.insert(tasks,co)
end

--[[
function dispatch()
    local i =1
    while true do
        if task[i] == nil then
            if task[1] == nil then
                break
            end
        i = 1
        end
        local res = tasks[i]()
        if not res then
            table.remove(tasks, i)
        else
            i =  i+1
        end
    end
end
--]]

function dispatch()
    local i =1
    while true do
        if task[i] == nil then
            if task[1] == nil then
                break
            end
        i = 1
        end
        local res = tasks[i]()
        if not res then
            table.remove(tasks, i)
        else
            i =  i + 1
            timedout[#timedout+1] = res
            if #timedout == #tasks then
                socket.select(timedout)
            end
        end
    end
end