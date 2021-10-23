local print = print
function foo (_ENV, a)
    print(a+b)
end

foo({b=14},12)
foo({b=10},1)

--[=[
    先把print声明为局部变量
    定义函数foo,由第一个参数获得指定的环境，并在获得的环境中获得b的值
    a的值由第二个参数传入
    最后结果
    14+12
    10+1

]=]