function insert(s1, n, s2)
    return string.sub(s1,0,n-1)..s2..string.sub(s1,n,-1)
end

b = insert("hello world", 1, "start: ")
c = insert("hello world", 7, "small ")