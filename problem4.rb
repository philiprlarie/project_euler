# Find the largest palindrome made from the product of two 3-digit numbers.

def is_palindrome?(n)
	digits = n.to_s.split("")
	i = 0
	while i < digits.count/2
		return false if digits[i] != digits[-1-i]
		i += 1
	end

	return true
end

def largest_palindrome
	numbers = []

	i = 100
	while i < 1000
		j = i
		while j < 1000
			numbers << i*j
			j += 1
		end
		i += 1
	end

	palindromes = numbers.select {|number| is_palindrome?(number)}

	return palindromes.max

end

p largest_palindrome