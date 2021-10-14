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

StackQueue=Stack:new()

function StackQueue:insertbottom(value)
    table.insert(self, 1 , value)
end

s=StackQueue:new({3})
print(s:top())
s:insertbottom(5)
print(s:top())
s:pop()
print(s:top())
