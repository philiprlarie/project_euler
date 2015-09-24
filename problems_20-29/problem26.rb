def how_many_repeat_digits(n)
  # this is like long division. keep dividing until you get a remainder you've seen before. then you know it will repeat from that point.
  # eg 13 √ 1 = 0.076923...
  #   13 √ 1   => 0 remainder 1 ***** start of repetition
  #   13 √ 10  => 0 remainder 10
  #   13 √ 100 => 7 remainder 9
  #   13 √ 90  => 6 remainder 12
  #   13 √ 120 => 9 remainder 3
  #   13 √ 30  => 2 remainder 4
  #   13 √ 40  => 3 remainder 1 ***** start of next repetition
  remainder = [1]
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
  
  answer = repeat_lengths.max_by { |k,v| v }
  puts "generating number => #{answer[0]}"
  puts "number of repeating digits => #{answer[1]}"
end
