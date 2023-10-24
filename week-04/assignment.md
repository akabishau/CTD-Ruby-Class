Create a git branch called methods-lesson and put the following ruby programs in it. Then push your changes to github and issue a pull request.

### Task 1
- Write a method that returns in an array all the numbers between 1 and 100 that are divisible by 2 or 3 or 5. 
- Then call the method in your program and print out what it returns. 
- Call the program divisible.rb.

### Task 2
- Write a program hangman.rb that contains a function called hangman. 
- The function's parameters are a word and an array of letters. 
- It returns a string showing the letters that have been guessed. 
- Call the function from within your program so that you know that it works.
 - Example: hangman("bob",["b"]) should evaluate to "b_b" Example: hangman("alphabet",["a","h"]) should return "a__ha___"

### Task 3
- Write a program that collects 5 keys and 5 values from the user, and stores them in a hash. 
- Write a function that accepts the hash as a parameter and prints out an array of keys and an array of values.
- Call the function within your program so you know it works. (Question: Can you find online information on Ruby hash methods that will help with this function?) 
- Call this program hash_to_array.rb.


### Task 4
- Create a program sums.rb with two classes.
- a class called Sum1 with 
    - an initialize method that takes two parameters - and sets the instance variable @total to the sum of the two. 
    - Include a line at the top of the class: attr_accessor :total

- a class called Sum2 with
    - an initialize method that takes two parameters a and b 
    - and sets the instance variable @a to the parameter a 
    - and the instance variable @b to the parameter b. 
    - Create a method new_total inside Sum2 that returns the sum of the instance variables @a and @b.

- In the mainline program, create instances of Sum1 and Sum2, passing 5 and 6 as parameters on the new statement.
- Print out the total for Sum1. 
- Print out the new_total for Sum2.

### Task 5
 - The ruby array sort method can use a block to sort various arrays. 
 - The block must compare between two elements of the array, a and b. 
 - If a < b, it should evaluate to -1. 
 - If a == b, it should evaluate to 0. 
 - And if a > b, it should evaluate to 1. 
 Here is the start of a program, which you should call sort_blocks.rb.
```ruby
class Book
  attr_reader :author, :title, :count
  def initialize(author,title,count)
    @author = author
    @title = title
    @count = count
  end
  def to_s
    "author: #{author} title: #{title} count: #{count}"
  end
end

book_array = []
book_array.push(Book.new("Beatrice Potter","Peter Rabbit",25))
book_array.push(Book.new("Henry Fielding","Tom Jones",12))
book_array.push(Book.new("Bob Woodward","All the President's Men",30))

puts "Sorting alphabetically by author"

new_array = book_array.sort do |a,b|
  author1 = a.author.downcase
  author2 = b.author.downcase
  author1 <=> author2
  # if author1 > author2
  #   1
  # elsif author1 < author2
  #   -1
  # else
  #   0
  # end
end
puts new_array
```
 - Note the use of the spaceship operator <=>. It does what the commented out lines do, but on one line. Add to this program. 
 - Add additional calls to book_array.sort that pass blocks. 
 - For your first call to sort, pass a block so that the array is sorted in order of title, and print out the array. 
 - For your second call to sort, pass a block so that the array is sorted in order of copies, and print out the array.

### Task 6
- Create a program block_function.rb. 
- It should have a function do_calc that calls a block using a yield statement. 
- The yield statement will pass the numbers 7 and 9 to a block, and then will print out the result.
- Call the do_calc function twice in your program. 
    - The first time, pass a block that adds the two numbers. 
    - The second time, pass a block that multiplies the two numbers. Your program should print out 16 and 63.
