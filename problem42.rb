# The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1); so the first ten triangle numbers are:
#
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
#
# By converting each letter in a word to a number corresponding to its alphabetical position and adding these values we form a word value. For example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the word value is a triangle number then we shall call the word a triangle word.
#
# Using words.txt (right click and 'Save Link/Target As...'), a 16K text file containing nearly two-thousand common English words, how many are triangle words?

####### get file input
txt = File.read("p042_words.txt")
words = txt.split('","')
words.first[0] = ""
words.last[words.last.length - 1] = ""

####### set constants
letter_values = Hash[('A'..'Z').zip(1..26)]

triangle_nums = {}
i = 1
while i * (i + 1) / 2 < 192 # max word counts = 192
  triangle_nums[i * (i + 1) / 2] = true
  i += 1
end

####### do the work
counts = words.map do |word|
  word_count = 0
  word.each_char { |char| word_count += letter_values[char] }
  word_count
end
# max => 192

p counts.count { |count| triangle_nums[count] }
