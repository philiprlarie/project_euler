two_power_1000 = 2 ** 1000

def find_each_digit(num)
  raise "don't give me a negative number" if num < 0
  return [num] if num < 10
  digits = []

  find_each_digit(num / 10) << num % 10
end


p find_each_digit(2**1000).inject(0) { |digit, accum| accum + digit }
