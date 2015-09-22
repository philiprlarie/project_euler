nums = [1]

i = 1
(1..500).each do |width|
  4.times do
    i += width * 2
    nums << i
  end
end

p nums.inject(:+)
