require_relative "problem18.rb"

input = File.new("p067_triangle.txt").readlines.map do |line|
  line.chomp.split(" ").map(&:to_i)
end

input.each_with_index do |row, row_idx|
  next if row_idx == 0

  make_max_row(row, input[row_idx - 1])
end

p input.last.max
