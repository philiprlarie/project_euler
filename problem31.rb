def num_ways_1_2(amount)
  amount / 2 + 1
end

def num_ways_1_2_5(amount)
  num_ways = 0
  while amount >= 0
    num_ways += num_ways_1_2(amount)
    amount -= 5
  end

  num_ways
end

def num_ways_1_2_5_10(amount)
  num_ways = 0
  while amount >= 0
    num_ways += num_ways_1_2_5(amount)
    amount -= 10
  end

  num_ways
end

def num_ways_1_2_5_20(amount)
  num_ways = 0
  while amount >= 0
    num_ways += num_ways_1_2_5_10(amount)
    amount -= 20
  end

  num_ways
end

def num_ways_1_2_5_50(amount)
  num_ways = 0
  while amount >= 0
    num_ways += num_ways_1_2_5_20(amount)
    amount -= 50
  end

  num_ways
end

def num_ways_1_2_5_100(amount)
  num_ways = 0
  while amount >= 0
    num_ways += num_ways_1_2_5_50(amount)
    amount -= 100
  end

  num_ways
end

def num_ways_1_2_5_200(amount)
  num_ways = 0
  while amount >= 0
    num_ways += num_ways_1_2_5_100(amount)
    amount -= 200
  end

  num_ways
end

if $PROGRAM_NAME == __FILE__
  puts "how many ways for 2"
  p num_ways_1_2_5_200(200)
end
