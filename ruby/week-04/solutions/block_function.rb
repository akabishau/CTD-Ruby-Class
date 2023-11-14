def do_calc
    result = yield(7, 9)
    puts result
end

do_calc { |a, b| a + b }
do_calc { |a, b| a * b }