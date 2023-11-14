def assert(expected, result)
  if expected == result
    puts "✅ Test Passed. RESULT: #{result}"
  else
    puts "🛑 Test Failed. RESULT: '#{result}' vs  EXPECTED: '#{expected}'"
  end
end
