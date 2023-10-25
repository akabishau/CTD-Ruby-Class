range_input = (1..100)
divisors_input = [2, 3, 5]


# option 1
def find_divisible_numbers
    numbers = (1..100).select do | number |
        number % 2 == 0 || number % 3 == 0 || number % 5 == 0
    end
    return numbers
end

print "\n=== Option 1 ===\n"
puts "Divisible Numbers: #{find_divisible_numbers.join(', ')}"


# opiton 2
def divisible_numbers(range, divisors)
    numbers = range.select do | number |
        divisors.any? do | divisor |
            number % divisor == 0
        end
    end
    return numbers
end

print "\n=== Option 2 ===\n"
puts "Divisible Numbers: #{divisible_numbers(range_input, divisors_input).join(', ')}"


# option 3
def divisible_numbers_with_block(range, divisors)
    numbers = range.select do | number |
        divisors.any? do | divisor |
            number % divisor == 0
        end
    end
    if block_given?
        yield numbers, range, divisors
    else
        puts "Divisible Numbers: #{numbers.join(', ')}"
    end
    numbers
end

print "\n=== Option 3 without block ===\n"
divisible_numbers_with_block(range_input, divisors_input) 

print "\n=== Option 3 with block ===\n"
divisible_numbers_with_block(range_input, divisors_input)  do |result, range, divisors|
    puts "Range: #{range.first} to #{range.last}"
    puts "Divisors: #{divisors.join(', ')}"
    puts "Divisible Numbers: #{result.join(', ')}"
end


