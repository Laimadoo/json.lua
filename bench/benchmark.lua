return function(t, f, ...)
    local startTime = os.clock()
    for i = 1, t do
        f(...)
    end
    local endTime = os.clock()
    return (endTime - startTime) * 1000
end