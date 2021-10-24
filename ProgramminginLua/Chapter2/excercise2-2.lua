N = 8
time = 0

function ispalceok (a,n,c)
    time = time+1
    for i=1, n-1 do
        if (a[i]==c) or (a[i]-i == c-n) or (a[i]+i == c+n) then
            return false
        end
    end
    return true
end

function isok(a)
    for i=1, N do
        if not ispalceok(a, i, a[i]) then
            return false
        end
    end
    return true
end


function printsolution(a)
    if isok(a) then
        for i=1, N do
            for j=1, N do
                io.write(a[i]==j and "X" or "-", " ")
            end
            io.write('\n')
        end
        io.write('\n')
    end
end

function genqueen(a,n)
    if n>N then
        printsolution(a)
    else
        for c=1, N do
            a[n]=c
            genqueen(a,n+1)
        end
    end
end