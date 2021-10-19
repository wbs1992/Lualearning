local Stacklist = {}

Stack = {}

function Stack:isempty()
    return #Stacklist[self]==0
end

function Stack:push(value)
    table.insert(Stacklist[self], value)
end

function Stack:pop()
    if #Stacklist[self]~=0 then
        table.remove(Stacklist[self])
    else
        error("Stack is Empty")
    end
end

function Stack:top()
    if #Stacklist[self]~=0 then
        return Stacklist[self][#Stacklist[self]]
    else
        return nil
    end
end

function Stack:new(o)
    o = o or {}
    local ini = o
    setmetatable(o, self)
    self.__index = self
    Stacklist[o]=ini
    return o
end

a = Stack:new()
print(a:isempty())
a:push(3)
a:push(4)
a:push(2)
print(a:isempty())
print(a:top())
print(a:pop())
print(a:top())
print(a:pop())
print(a:top())
print(a:pop())
print(a:isempty())
