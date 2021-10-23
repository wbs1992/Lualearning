--[=[
在没有瞬表之前，弱表中键与值循环引用，阻止垃圾收集器收集循环内的元素，即使他们不能从外部访问

5.3版本引入的瞬表，在5.3中一个具有弱引用键和强引用值的表是一个瞬表，在瞬表中，一个键的可访问性控制着对应值的可访问性
比如一个瞬表中的元素（k,v),指向v的引用 只有当存在某些指向k的其他上部引用存在时才是强引用，否则，即使v引用了k，垃圾收集器最终还是会收集k 并把元素中表中删除

---]=]



do
    local test = {}
    setmetatable(test, {__mode = "k"})
    temp = {[1] = function() return temp end}
    setmetatable(temp, {__mode = "k", __gc = function() print("垃圾回收成功") end})
    test[temp] = temp[1]
    test[temp] = nil
    collectgarbage()
end