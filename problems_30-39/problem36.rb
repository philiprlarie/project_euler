# The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.
#
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
#
# (Please note that the palindromic number, in either base, may not include leading zeros.)

def base_2(num)
  base_2_digits = []
  until num == 0
    base_2_digits << num % 2
    num /= 2
  end
  base_2_digits.reverse.join.to_i
end

def is_number_palandrome?(num)
  num.to_s == num.to_s.reverse
end

palandromes = []
(1..1000000).each do |num|
  if is_number_palandrome?(num) && is_number_palandrome?(base_2(num))
    palandromes << num
  end
end

p palandromes.inject(:+)
