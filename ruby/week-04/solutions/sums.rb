class Sum1
    attr_accessor :total
    
    def initialize(a, b)
        @total = a + b
    end
end

class Sum2
    def initialize(a, b)
        @a = a
        @b = b
    end

    def new_total
        @a + @b
    end
end

sum1 = Sum1.new(5, 6)
puts "Total for Sum1: #{sum1.total}"

sum2 = Sum2.new(5, 6)
puts "Total for Sum2: #{sum2.new_total}"