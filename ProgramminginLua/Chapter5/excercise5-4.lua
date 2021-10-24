

function polynomial(x)
    b={1,2,3,4}
    sum=0
    text=" "
    for i=1, #b do
        sum=sum + b[i]*x^(i-1)
        text=text.. b[i] .. "x^" .. (i-1) .."+"
    end
    print(sum)
    print(text)
end



polynomial(2)