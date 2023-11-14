def translate(prompt)
    words = prompt.split.map do | word |
        if is_vowel(word)
             handle_vowel_sound(word)
        else
            handle_consonant_sound(word)
        end
    end.join(" ")
end

# helper functions
def is_vowel(prompt)
    ['a', 'e', 'i', 'o', 'u'].include?(prompt[0])
end

def handle_vowel_sound(prompt)
    prompt + "ay"
end

def handle_consonant_sound(prompt)
    return handle_qu_case(prompt) if prompt.start_with?("qu")
    phoneme = ""
    break_index = 0
    prompt.each_char.with_index do | char, index |
        if (char == "u" && prompt[index - 1] == "q") || !is_vowel(char)
            phoneme += char
            break_index = index + 1
            next
        else
            break
        end
    end
    prompt[break_index..-1] + phoneme + "ay"
end

def handle_qu_case(word)
    word[2..-1] + word[0..1] + "ay"
end