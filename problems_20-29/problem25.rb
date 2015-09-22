thousand_digit_arr = [1]
999.times { thousand_digit_arr << 0 }
thousand_digit = thousand_digit_arr.join("").to_i

smaller_fib = 1
current_fib = 1
idx = 2
while current_fib / thousand_digit < 1
  next_fib = current_fib + smaller_fib
  smaller_fib = current_fib
  current_fib = next_fib
  idx += 1
end

p idx
