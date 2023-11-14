class Book
    attr_reader :title

    def initialize
        @title = ""
    end

    # setter logic
    def title=(prompt)
        ignore_list = ["in", "of", "a", "an", "and", "the"]
        words = prompt.split.map.with_index do | word, index |
            ignore_list.include?(word) && index != 0 ? word : word.capitalize
        end
        @title = words.join(" ")
    end
end
