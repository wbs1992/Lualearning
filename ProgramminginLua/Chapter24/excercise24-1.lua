function receive(prod)
    return coroutine.yield()
end

function send(prod, x)
    coroutine.resume(prod, x)
end

function producer(prod)
    while true do
        local x = io.read()
        send(x)
    end
end

function consumer(x)
    while true do
        local x = receive()
        io.write(x, '/n')
    end
end

consumer = coroutine.create(consumer)
