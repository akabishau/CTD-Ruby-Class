### Task 1
# - Write a program which asks for a person's first name, then middle, then last. 
# - It should store each of these parts in an array.
# - Finally, it should greet the person using their full name.
# - Call the program full_name.rb.

name_questions = ["first", "middle", "last"]

def ask_user_name(questions)
    parts_of_name = []
    questions.each do | part |
        puts "What's you #{part} name?"
        value = gets.chomp.strip
        parts_of_name.push(value)
    end
    return parts_of_name
end

def print_full_name(name_parts)
    cleaned_parts = name_parts.reject{ |part| part.empty? }
    print cleaned_parts
    normilized_parts = cleaned_parts.map{ |part| part.downcase.capitalize }
    full_name = normilized_parts.join(" ")
    puts "Hi, #{full_name}!"
end

user_name_parts = ask_user_name(name_questions)
print_full_name(user_name_parts)