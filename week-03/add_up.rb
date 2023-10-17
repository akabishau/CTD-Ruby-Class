# ### Task 3
# - Write a program with a function add_up(i).
# - It is to be passed a positive integer, and it will add all the numbers from 1 to that integer and return the sum.
# - Call the function three times within the program, and each time print out the return value.
# - Call the program add_up.rb.


def add_up(i)
    if i <= 0
        return "Invalid Input: #{i} - must be a number > 0", ""
    end
    sum = 0
    expression = ""
    1.upto(i) do |number| 
        sum += number
        expression += (number == i ? "#{number}" : "#{number}+")
    end
    return sum, expression
end

def print_result_of_add_up(i)
    sum, expression = add_up(i)
    if expression.empty?
        puts sum
    else
        puts "Result of adding up to #{i}: #{sum}=#{expression}"
    end
end


print_result_of_add_up(5)
print_result_of_add_up(10)
print_result_of_add_up(-2)
print_result_of_add_up(0)
