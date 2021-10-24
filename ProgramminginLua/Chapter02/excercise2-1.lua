N = 8
ha = false
alloutput = true
time=0

function ispalceok (a,n,c)
    time = time+1
    for i=1, n-1 do
        if (a[i]==c) or (a[i]-i == c-n) or (a[i]+i == c+n) then
            return false
        end
    end
    return true
end

function printsolution(a)
    if alloutput or not alloutput and not ha then
        for i=1, N do
            for j=1, N do
                io.write(a[i]==j and "X" or "-", " ")
            end
            io.write('\n')
        end
        io.write('\n')
        ha = true
    end
end

function addqueen(a,n)
    if n>N then
        printsolution(a)
    else
        for c=1, N do
            if ispalceok(a,n,c) then
                a[n]=c
                addqueen(a,n+1)
            end
        end
    end
end

