class Book
    attr_reader :author, :title, :count
    def initialize(author,title,count)
        @author = author
        @title = title
        @count = count
    end

    def to_s
        # %s - string arg; 20 - min width; '-' left-justified
        format("%-20s %-30s %10s", author, title, count)
    end
end

def print_sort_books(criteria, books)
    puts "\n"
    puts "==== #{'Sorting ' + criteria} ====".center(60)
    puts format("%-20s %-30s %10s", "Author", "Title", "Copies")
    puts books
end

book_array = []
book_array.push(Book.new("Beatrice Potter", "Peter Rabbit", 25))
book_array.push(Book.new("Henry Fielding", "Tom Jones", 12))
book_array.push(Book.new("Bob Woodward", "All the President's Men", 30))

new_array = book_array.sort do |a, b|
    a.author.downcase <=> b.author.downcase # desc
end
print_sort_books("alphabetically by Author", new_array)


new_array = book_array.sort do |a, b|
    a.title.downcase <=> b.title.downcase # desc
end
print_sort_books("alphabetically by Title", new_array)

new_array = book_array.sort do |a, b|
    b.count <=> a.count # desc
end

print_sort_books("by number of Copies ⬇️", new_array)