# A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
#
# A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.
#
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.
#
# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

def factors(n)
  small_factors = []
  square_root = Math.sqrt(n)

  i = 1
  while i <= square_root
    small_factors << i if n % i == 0
    i += 1
  end

  large_factors = small_factors.map { |small_factor| n / small_factor }

  if small_factors.last * small_factors.last == n # if it's a perfect square
    return small_factors + large_factors[1...-1].reverse
  else
    return small_factors + large_factors.drop(1).reverse
  end
end

def is_abundant?(n)
  factors(n).inject(:+) > n
end

def abundant_nums_upto(n)
  (2..n).select { |num| is_abundant?(num) }
end

def can_not_be_written_as_sum
  nums = {}
  abundant_nums = abundant_nums_upto(28123)
  (1..28123).each { |num| nums[num] = false } # assume it can't be written as the sum of two abundant numbers
  abundant_nums.each do |m|
    abundant_nums.each do |n|
      nums[m + n] = true
    end
  end
  nums.select { |k, v| !v }.keys
end

def sum_of_cant_be_written_as_sum
  can_not_be_written_as_sum.inject(:+)
end


if $PROGRAM_NAME == __FILE__
  p sum_of_cant_be_written_as_sum
end
