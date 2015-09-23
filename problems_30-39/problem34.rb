# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
#
# Find the sum of all numbers which are equal to the sum of the factorial of their digits.
#
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

# since 9! * 8 = 2903040 is seven digits long, we know we cant have a number that is longer than 7 digits. the best we could hope for is like 100000 = 9! + 9! + 9! + 9! + 9! + 9! + 9!

FACT = {
  0 => 1,
  1 => (1..1).inject(:*),
  2 => (1..2).inject(:*),
  3 => (1..3).inject(:*),
  4 => (1..4).inject(:*),
  5 => (1..5).inject(:*),
  6 => (1..6).inject(:*),
  7 => (1..7).inject(:*),
  8 => (1..8).inject(:*),
  9 => (1..9).inject(:*)
}

def problem34
  good_nums = []
  (1..FACT[9] * 9).each do |current_num|
    digits = get_digits(current_num)
    fact_sum = digits.inject(0) { |sum, digit| sum + FACT[digit] }
    good_nums << current_num if current_num == fact_sum
  end

  p good_nums
  good_nums.inject(:+)
end

def get_digits(num)
  digits = []
  while num > 0
    digits << num % 10
    num /= 10
  end
  digits.reverse
end

p problem34
