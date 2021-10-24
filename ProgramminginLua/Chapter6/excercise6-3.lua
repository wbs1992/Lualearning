function test(...)
    a=table.pack(...)
    table.remove(a, #a)
    return table.unpack(a)
end

print(test(1,2,3,4,5,6))