def echo(prompt)
    prompt 
end


def shout(prompt)
    prompt.upcase
end

def repeat(prompt, num = 2)
    result = []
    num.times { result.push(prompt) }
    result.join(' ')
end

def start_of_word(prompt, num)
    prompt[0..(num - 1)]
end


def first_word(prompt)
    prompt.split(" ").first
end

def titleize(prompt)
    ignore_list = ["and", "the", "over"]
    words = prompt.split.map.with_index do | word, index |
        ignore_list.include?(word) && index != 0 ? word : word.capitalize
    end
    words.join(" ")
end