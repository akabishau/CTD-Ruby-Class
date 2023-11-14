def hangman(word, letters)
    result = ""
    word.each_char do |char|
        if letters.include?(char)
            result += char
        else
            result += "_"
        end
    end
    result
end

puts hangman("bob",["b"])
puts hangman("alphabet",["a","h"])
