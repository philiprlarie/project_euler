# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

# a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.

# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

def is_pythag_trip?(a,b,c)
	if a ** 2 + b ** 2 == c ** 2
		return true
	elsif b ** 2 + c ** 2 == a ** 2
		return true
	elsif c ** 2 + a ** 2 == b ** 2
		return true
	else
		return false
	end
end

def problem9
	a = 1
	while a < 1000
		b = a
		c = 1000
		while b < 1000
			c = 1000 - a - b
			return(a * b * c) if is_pythag_trip?(a, b, c)
			b += 1
		end
		a += 1
	end
end

p problem9
