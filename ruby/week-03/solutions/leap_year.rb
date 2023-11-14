# ### Task 4
# - Write a program, leap_year.rb.
# - It will ask the user for a starting year and an ending year, and it will then print out all the leap years between them, including the starting or ending year if those are leap years.
# - The rules for leap years are: A leap year is divisible by 4, except for years that are divisible by 100 -- those aren't leap years -- except for years that are divisible by 400, which ARE leap years.

def leap_year?(year)
    (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
end

def print_leap_years(start_year, end_year)
    leap_years = []
    (start_year..end_year).each do | year |
        if leap_year?(year)
            leap_years.push(year)
        end
    end

    range = "#{start_year}-#{end_year}"

    if leap_years.empty?
        puts "There are no leap years in the range #{range}"
    elsif leap_years.length == 1
        puts "#{leap_years[0]} is the only leap year in the range #{range}"
    else
        puts "Here is the list of all leap years in the range #{range}:"
        puts leap_years.join(", ")
    end
end


def handle_user_input
    puts "Enter the startin year"
    start_year = gets.chomp.to_i
    

    puts "Enter the ending year:"
    end_year = gets.chomp.to_i

    while end_year < start_year
        puts "The ending year must be greater or equal to the starting year (#{start_year}) you've entered"
        puts "Enter the ending year again:"
        end_year = gets.chomp.to_i
    end

    return start_year, end_year
end

puts "\n=== Testing Start ==="
puts "Test 1"
print_leap_years(2015, 2022)
puts "Test 2"
print_leap_years(2015, 2016)
puts "Test 3"
print_leap_years(1890, 1920)
puts "=== Testing End ===\n\n"

start_year, end_year = handle_user_input
print_leap_years(start_year, end_year)