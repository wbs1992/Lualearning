local foo
do
    local _ENV = _ENV
    function foo() print(X) end
end
X = 13
_ENV = nil
foo()
X = 0
foo()

--[=[
    定义局部函数foo，print其私有环境的X字段，同时将其私有环形赋值为全局环境
    第一次调用foo()时，打印X = 13
    第二次进行X=0的赋值时，因为全局环境被设置为nil，所以调用X抛出异常

]=]