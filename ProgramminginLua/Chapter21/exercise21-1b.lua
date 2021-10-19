Stack = {}

function Stack:isempty()
    return #self==0
end

function Stack:push(value)
    table.insert(self, value)
end

function Stack:pop()
    if #self~=0 then
        table.remove(self)
    else
        error("Stack is Empty")
    end
end

function Stack:top()
    if #self~=0 then
        return self[#self]
    else
        return nil
    end
end

function Stack:new(o)
    o=o or {}
    self.__index = self
    setmetatable(o, self)
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
