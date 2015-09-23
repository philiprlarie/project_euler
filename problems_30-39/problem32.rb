require "byebug"
# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.
#
# The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.
#
# Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.
#
# HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.

# 1*2=3456789
# ...
# 1*2345678=9
# 12*3=456789
# ...
# 1234567*8=9
# if we go this way for each of our 362880 permutations we will perform 7+6+5+4+3+2+1 = 28 tests. that seems ok.

good_eqns = []
good_products = []
orders = [1,2,3,4,5,6,7,8,9].permutation.to_a

orders.each do |order|
  (1..3).each do |mult_spot|
    ((mult_spot + 1)..5).each do |eql_spot|
      multiplicand = order[0...mult_spot].join("").to_i
      multiplier = order[mult_spot...eql_spot].join("").to_i
      product = order[eql_spot..-1].join("").to_i
      if multiplicand * multiplier == product
        good_eqns << [multiplicand, multiplier, product]
        good_products << product
      end
    end
  end
end

p good_eqns
p good_products
p good_products.uniq
p good_products.uniq.inject(:+)
