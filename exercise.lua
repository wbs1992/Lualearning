function newstack()
    local self = {first = 0 , last = -1}

    local push = function(v)
    end

    local pop = function()
    end

    local top = function()
    end

    local isempty = function()
    end

    return {
        push = push,
        pop = pop,
        top = top
    }
end