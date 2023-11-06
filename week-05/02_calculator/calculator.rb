def add(a, b)
    a + b
end

def subtract(a, b)
    a - b
end

def sum(array)
    array.inject(0){ |sum, num| sum += num }
end
