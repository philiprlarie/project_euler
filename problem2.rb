# By considering the terms in the 
# Fibonacci sequence whose values 
# do not exceed four million, 
# find the sum of the even-valued terms.

def fib_numbers(max) #max must be integer 1 or greater
	fib = [1,1]

	i = 1

	while fib[i] < max
		fib << fib[i] + fib[i-1]
		i += 1
	end

	fib.delete_at(fib.length - 1) if fib.last > max

	return fib
end

def fib_sum(max)
	all_numbs = fib_numbers(max)

	even_numbs = all_numbs.select{|numb| numb%2 == 0}

	sum = 0

	even_numbs.each {|numb| sum += numb}

	return sum
end


p fib_sum(4000000)
