local count = 0

local mt = { __gc = function() count=count-1 end}
local a = {}

for i = 1, 10000 do
    count = count +1
    a[i] = setmetatable({}, mt)
end

collectgarbage()
print(collectgarbage("count")*1024 , count)
a = nil

collectgarbage()
print(collectgarbage("count")*1024 , count)

collectgarbage()
print(collectgarbage("count")*1024 , count)

--[=[
    第一次收集前a是可达的，此时没有析构
    第二次收集前a被置为nil,没有被标记为活跃，然后进行清理阶段。遍历弱引用表从中移除键或值未被标记的元素
    然后清楚阶段遍历所有对象，把没有标记为活跃的对象进行回收，最后进行析构。lua调用清理阶段被分离出来的对象的析构器
    所以第二次第三次count为-
]=]