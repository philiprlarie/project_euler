# An irrational decimal fraction is created by concatenating the positive integers:
#
# 0.123456789101112131415161718192021...
#
# It can be seen that the 12th digit of the fractional part is 1.
#
# If dn represents the nth digit of the fractional part, find the value of the following expression.
#
# d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000

str = ""
i = 1
while str.length < 1000000
  str.concat(i.to_s)
  i += 1
end

d1 = str[1 - 1].to_i
d10 = str[10 - 1].to_i
d100 = str[100 - 1].to_i
d1000 = str[1000 - 1].to_i
d10000 = str[10000 - 1].to_i
d100000 = str[100000 - 1].to_i
d1000000 = str[1000000 - 1].to_i

p d1 * d10 * d100 * d1000 * d10000 * d100000 * d1000000
