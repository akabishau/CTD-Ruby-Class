require_relative "assertions"

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

# test cases
def test_hangman
    assert("b_b", hangman("bob",["b"]))
    assert("a__ha___", hangman("alphabet",["a","h"]))
    assert("aha", hangman("alphabet",["a","h"])) # intentionally wrong
end

test_hangman