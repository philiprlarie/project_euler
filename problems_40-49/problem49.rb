# kind of hard

# The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways: (i) each of the three terms are prime, and, (ii) each of the 4-digit numbers are permutations of one another.
#
# There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, but there is one other 4-digit increasing sequence.
#
# What 12-digit number do you form by concatenating the three terms in this sequence?
require_relative "../useful_functions.rb"

PRIMES = sieve_of_eratosthenes_hash(9999)

primes = sieve_of_eratosthenes(9999).select { |prime| prime >= 1000 }
primes_w_permutations = []
i = 0
while i < primes.length
  digits = get_digits(primes[i])
  perms = digits.permutation.to_a.map { |perm| perm.join("").to_i }
  perms.select! { |perm| perm >= 1000 && PRIMES[perm] }
  perms.uniq!
  perms.sort!
  primes_w_permutations << perms if perms.length >= 3
  primes -= perms
end

# p primes_w_permutations

answer = nil
primes_w_permutations.each do |set|
  i = 0
  while i < set.length
    j = i + 1
    while j < set.length
      k = j + 1
      while k < set.length
        if set[k] - set[j] == set[j] - set[i] && set[k] != 8147
          answer = [set[i], set[j], set[k]]
          break
        end
        k += 1
      end
      break if answer
      j += 1
    end
    break if answer
    i += 1
  end
end

p answer

# p set_of_differences = primes_w_permutations.map { |set| set.permutation(2).to_a.map { |pair| pair[1] - pair[0] }.select { |num| num > 0 }.sort }
#
# good_idxs = []
# set_of_differences.each_with_index do |differences, i_set|
#   (differences.length - 1).times do |i|
#     if differences[i + 1] == differences[i]
#       good_idxs << i_set
#       break
#     end
#   end
# end
#
# p good_idxs
# # candidates = set_of_differences.map { |single_set| single_set.group_by { |e| e }.select { |k, v| v.size >= 2 }
