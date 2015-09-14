#if we list all the natural numbers below 10 that are 
#multiples of 3 or 5, we get 3, 5, 6 and 9. 
#The sum of these multiples is 23.

#Find the sum of all the multiples of 3 or 5 below 1000.

def is_mult_3_5?(n)
	return true if n%3 == 0 || n%5 == 0
	return false
end

def sum_of_mults(n)
	numbers = (1..n).to_a
	good_numbers = numbers.select {|number| is_mult_3_5?(number)}

	sum = 0

	good_numbers.each {|number| sum += number}

	return sum
end

puts sum_of_mults(999)

