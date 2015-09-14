# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
#
#
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

NUMBERS = {
  1000 => "one thousand",
  1 => "one",
  2 => "two",
  3 => "three",
  4 => "four",
  5 => "five",
  6 => "six",
  7 => "seven",
  8 => "eight",
  9 => "nine"
}

TEENS = {
  10 => "ten",
  11 => "eleven",
  12 => "twelve",
  13 => "thirteen",
  14 => "fourteen",
  15 => "fifteen",
  16 => "sixteen",
  17 => "seventeen",
  18 => "eighteen",
  19 => "nineteen"
}

TENS = {
  10 => "ten",
  20 => "twenty",
  30 => "thirty",
  40 => "fourty",
  50 => "fifty",
  60 => "sixty",
  70 => "seventy",
  80 => "eighty",
  90 => "ninty"
}


def under_100_to_words(num)
  raise "number too large" if num > 99
  return NUMBERS[num] if num < 10
  return TEENS[num] if num < 20

  words = TENS[num / 10 * 10]
  words += "-" + NUMBERS[num % 10] unless num % 10 == 0
  return words
end

def under_1000_to_words(num)
  raise "number too large" if num > 1000
  return "one thousand" if num == 1000
  return under_100_to_words(num) if num < 100

  words = NUMBERS[num / 100] + " hundred"
  words += " and " + under_100_to_words(num % 100) unless num % 100 == 0
  return words
end


nums = (1..1000).to_a

words = nums.map { |num| under_1000_to_words(num) }

words.map! { |word| word.split(" ").join.split("-").join}

puts words.join.length


#
