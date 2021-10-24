function test(tab, begin)
    begin=begin or 0
    if begin==0 then
        name = 1
    end
    if anstable==nil or begin==0 then
        anstable={}
    end
    if sptable==nil or begin==0 then
        sptable={}
    end
    if begin==(#tab) then
        anstable[name]=table.move(sptable, 1, #sptable, 1, {})
        name = name+1
    else
        table.insert( sptable, tab[begin+1] )
        test(tab, begin+1)
        table.remove( sptable )
        test(tab, begin+1)
    end
    return anstable

end

arr={1,2,3,4,5}
ans=test(arr)
--[[for i=1, #ans do
    print(table.unpack(ans[i]))
end
]]--
print(table.unpack(ans[30]))
print(#ans)
