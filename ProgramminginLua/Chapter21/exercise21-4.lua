function newAccount(initialBalance)
    local o = {balance = initialBalance or 0}
    local proxy = {}

    local mt = {
        balance = function()
            return o.balance
        end,

        withdraw = function(v)
            o.balance = o.balance - v 
        end,
        
        deposit = function(v)
            o.balance = o.balance + v 
        end,
    }

    mt.__index = mt
    setmetatable(proxy, mt)
    return proxy
end

a = newAccount(100)
print(a.balance())
a.withdraw(50)
print(a.balance())
a.deposit(21)
print(a.balance())
