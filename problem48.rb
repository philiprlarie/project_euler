# The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
#
# Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

sum = 0
(1..1000).each do |i|
  sum += i ** i % 10000000000
  sum = sum % 10000000000
end

p sum
