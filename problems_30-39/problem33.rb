# The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.
#
# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
#
# There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.
#
# If the product of these four fractions is given in its lowest common terms, find the value of the denominator.

good_fracs = []
(10..99).each do |num|
  ((num + 1)..99).each do |den|
    next if num % 10 == 0 && den % 10 == 0
    num_digits = [num / 10, num % 10]
    den_digits = [den / 10, den % 10]
    if num_digits[0] == den_digits[1]
      if num.to_f / den == num_digits[1].to_f / den_digits[0]
        good_fracs << [num, den]
      end
    elsif num_digits[1] == den_digits[0]
      if num.to_f / den == num_digits[0].to_f / den_digits[1]
        good_fracs << [num, den]
      end
    elsif num_digits[0] == den_digits[0]
      if num.to_f / den == num_digits[1].to_f / den_digits[1]
        good_fracs << [num, den]
      end
    elsif num_digits[1] == den_digits[1]
      if num.to_f / den == num_digits[0].to_f / den_digits[0]
        good_fracs << [num, den]
      end
    end
  end
end

p good_fracs
# [[16, 64], [19, 95], [26, 65], [49, 98]]
# answer is 100
