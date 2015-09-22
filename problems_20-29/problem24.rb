# nums = [0,1,2,3,4,5,6,7,8,9]
# lexi_order = 1000000 - (1...nums.length).inject(:*) * 2
# # => 274240
# nums.delete_at(3)
# # the first digit is 2. digits left = [0,1,3,4,5,6,7,8,9]
#
# p 274240 - (1...nums.length).inject(:*) * 6
# nums.delete_at(7)


nums = [0,1,2,3,4,5,6,7,8,9]
good_num = []
lexi_order = 1000000

while lexi_order > 1
  i = 1
  while lexi_order > (1...nums.length).inject(:*) * i
    i += 1
  end
  lexi_order -= (1...nums.length).inject(:*) * (i - 1)
  good_num << nums.delete_at(i - 1)
end

p (good_num + nums).join("")
