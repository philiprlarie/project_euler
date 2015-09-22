# Longest Collatz sequence
# The following iterative sequence is defined for the set of positive integers:
#
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)
#
# Using the rule above and starting with 13, we generate the following sequence:
#
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
#
# Which starting number, under one million, produces the longest chain?
#
# def problem14
#   possible_nums = (1..1000000).to_a
#
#   longest_chain = 0
#   longest_seed = 1
#
#   until possible_nums.empty? do
#     starting_num = possible_nums[0]
#     sequence = get_sequence(starting_num)
#     if longest_chain < sequence.length
#       longest_chain = sequence.length
#       longest_seed = starting_num
#     end
#     sequence.each { |num| possible_nums.delete(num) }
#     p starting_num
#   end
#
#   longest_seed
# end
#
# def get_sequence(n)
#   return [1] if n == 1
#   chain = []
#   until n == 1 do
#     chain << n
#     if n.even?
#       n = n/2
#     else
#       n = 3 * n + 1 if n.odd?
#     end
#   end
#
#   chain
# end
#
# # p get_sequence(2)
# # p get_sequence(5)
# # p get_sequence(7)
# # p get_sequence(10)
# # p get_sequence(20)
# p problem14


def problem14
  possible_nums = (1..1000000).to_a

  longest_chain = 0
  longest_seed = 1

  possible_nums.each do |num|
    sequence = get_sequence(num)
    seq_len = sequence.length
    if longest_chain < seq_len
      longest_chain = seq_len
      longest_seed = num
    end
    p num
  end

  longest_seed
end

def get_sequence(n)
  return [1] if n == 1
  chain = []
  until n == 1 do
    chain << n
    if n.even?
      n = n/2
    else
      n = 3 * n + 1 if n.odd?
    end
  end

  chain
end

# p get_sequence(2)
# p get_sequence(5)
# p get_sequence(7)
# p get_sequence(10)
# p get_sequence(20)
p problem14
