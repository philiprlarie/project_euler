require 'byebug'
# Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
#
# 1634 = 14 + 64 + 34 + 44
# 8208 = 84 + 24 + 04 + 84
# 9474 = 94 + 44 + 74 + 44
# As 1 = 14 is not a sum it is not included.
#
# The sum of these numbers is 1634 + 8208 + 9474 = 19316.
#
# Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

# 9 ** 5 * 6 => 354294, 9 ** 5 * 7 => 413343
# thus our number can't be more than 6 digits

good_nums = []
(0..9).each do |a|
  (0..9).each do |b|
    (0..9).each do |c|
      (0..9).each do |d|
        (0..9).each do |e|
          (0..9).each do |f|
            p "#{a} #{b} #{c} #{d} #{e} #{f}"
            if a ** 5 + b ** 5 + c ** 5 + d ** 5 + e ** 5 + f ** 5 ==
              [a.to_s, b.to_s, c.to_s, d.to_s, e.to_s, f.to_s].join("").to_i
              good_nums << a ** 5 + b ** 5 + c ** 5 + d ** 5 + e ** 5 + f ** 5
            end
          end
        end
      end
    end
  end
end

p good_nums
p good_nums.inject(:+) - 1
