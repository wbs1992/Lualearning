function newstack()
    local self = {first = 0 , last = -1}

    local push = function(value)
        local last = self.last + 1
        self.last = last
        self[last] = value
    end

    local pop = function()
        local last = self.last
        if self.first > last then error("List is empty") end
        local value = self[last]
        self[last] = nil
        self.last = last - 1
        return value
    end

    local top = function()
        local last = self.last
        if self.first > last then error("List is empty") end
        local value = self[last]
        return value
    end

    local isempty = function()
        return self.first > self.last
    end

    return {
        push = push,
        pop = pop,
        top = top,
        isempty = isempty
    }
end

a = newstack()
print(a.isempty())
a.push(3)
a.push(4)
a.push(2)
print(a.isempty())
print(a.top())
print(a.pop())
print(a.top())
print(a.pop())
print(a.top())
print(a.pop())
print(a.isempty())
