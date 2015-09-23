#Find the sum of all the primes below two million.

def seive_of_eratosthenes(top)
	primes = Hash.new(true)
	i = 2
	while i <= top
		primes[i] = true
		i += 1
	end
	i = 2
	while i < top
		if primes[i] == true
			j = i
			while i*j <= top
				primes[i*j] = false
				j += 1
			end
		end
		i += 1
	end

	return primes
end

primes = (seive_of_eratosthenes(2000000).select {|key,value| value}).keys
sum = 0
primes.each {|prime| sum += prime}
puts sum


#! /usr/bin/ruby

# def prime(x)
#     if ( x == 1 )
#         return false
#     end

#     maxN = Math.sqrt(x).floor
#     2.upto(maxN) do |i|
#         if ( x % i == 0 )
#             return false
#         end
#     end
#     return true
# end

# sum = 2
# 3.step(2000000,2) do |i|
#     if prime(i)
#         sum += i
#     end
# end

# puts "answer: #{sum}"
