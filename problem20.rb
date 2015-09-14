product = 1
(1..100).each do |num|
  product *= num
end

sum = 0
while product > 0
  sum += product % 10
  product = product / 10
end

p sum
