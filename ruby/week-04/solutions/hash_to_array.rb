def ask_question
    print "Enter a key: "
    key = gets.chomp
    print "Enter a value for a key '#{key}': "
    value = gets.chomp
    return {key => value}
end

def print_arrays_from(hash)
    puts "Keys: #{hash.keys.join(', ')}"
    puts "Values: #{hash.values.join(', ')}"
end

def get_user_input_times(n)
    user_hash = {}
    n.times do
        user_hash.merge!(ask_question)
    end
    user_hash
end

print_arrays_from(get_user_input_times(5))