
def how_many_repeat_digits(n)
  remainder = [1]

  # this is like long division. keep dividing until you get something you've seen before. then you know it will repeat from that point.
  while true
    if remainder.last == 0
      return -1
    elsif idx = remainder.find_index((remainder.last * 10) % n)
      return remainder.length - idx
    else
      remainder << (remainder.last * 10) % n
    end
  end
end



if $PROGRAM_NAME == __FILE__
  nums = (1..1000).to_a
  repeat_lengths = {}

  nums.each do |num|
    repeat_lengths[num] = how_many_repeat_digits(num)
  end

  p repeat_lengths.max_by { |k,v| v }
end
