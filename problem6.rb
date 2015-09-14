# Find the difference between the sum of 
# the squares of the first one hundred natural 
# numbers and the square of the sum.

def problem6(num)
	numbers = (1..num).to_a

	sum1 = 0
	numbers.each {|number| sum1 += number**2}

	sum2 = 0
	numbers.each {|number| sum2 += number}

	return sum2**2 - sum1
end

p problem6(100)
