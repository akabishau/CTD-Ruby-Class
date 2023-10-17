# ### Task 2
# - Write a program called sorted_words.rb.
# - It should prompt the user for words and add each to an array.
# - The user should be able to add as many words as they like, until they just hit enter to return a blank word.
# - Then sort the array using the sort method and print it out.

words = []

loop do
    print "Enter the word (hit Enter to stop): "
    word = gets.chomp.strip
    break if word.empty?
    words.push(word)
end

puts "Here is your list sorted alphabetically: #{words.sort.join(", ")}"
