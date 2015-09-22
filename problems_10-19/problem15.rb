# #
# # Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
#
# ####### recursive way to do it. too ineffecient
# def find_paths(n, m)
#   if n == 1 || m == 1
#     return n > m ? n + 1 : m + 1
#   end
#
#   find_paths(n, m - 1) + find_paths(n - 1, m)
# end
#
# def run_the_show(n, m)
#   beginning_time = Time.now
#   puts "length #{m}"
#   p find_paths(n, m)
#   end_time = Time.now
#   puts "Time elapsed #{(end_time - beginning_time)} seconds"
# end
#
# (1..14).each { |m| run_the_show(m, m) }
#
# ####### output
# # /project_euler Philip$ ruby problem15.rb
# # length 1
# # 2
# # Time elapsed 4.7e-05 seconds
# # length 2
# # 6
# # Time elapsed 1.1e-05 seconds
# # length 3
# # 20
# # Time elapsed 2.0e-05 seconds
# # length 4
# # 70
# # Time elapsed 1.3e-05 seconds
# # length 5
# # 252
# # Time elapsed 2.0e-05 seconds
# # length 6
# # 924
# # Time elapsed 0.000105 seconds
# # length 7
# # 3432
# # Time elapsed 0.000214 seconds
# # length 8
# # 12870
# # Time elapsed 0.000648 seconds
# # length 9
# # 48620
# # Time elapsed 0.002576 seconds
# # length 10
# # 184756
# # Time elapsed 0.009912 seconds
# # length 11
# # 705432
# # Time elapsed 0.031184 seconds
# # length 12
# # 2704156
# # Time elapsed 0.120244 seconds
# # length 13
# # 10400600
# # Time elapsed 0.444079 seconds
# # length 14
# # 40116600
# # Time elapsed 1.658722 seconds
# # /project_euler Philip$


# functional programming. see link (http://www.mathblog.dk/project-euler-15/)

def find_paths_from(n, m)
  paths = Array.new(n + 1) { Array.new(m + 1) }

  (n + 1).times do |row|
    paths[row][0] = 1
  end
  (m + 1).times do |col|
    paths[0][col] = 1
  end

  (1..n).each do |row|
    (1..m).each do |col|
      paths[row][col] = paths[row - 1][col] + paths[row][col - 1]
    end
  end

  paths[n][m]
end

def run_the_show(n, m)
  beginning_time = Time.now
  puts "length #{m}"
  p find_paths_from(n, m)
  end_time = Time.now
  puts "Time elapsed #{(end_time - beginning_time)} seconds"
end

(1..20).each { |m| run_the_show(m, m) }

####### output
# /project_euler Philip$ ruby problem15.rb
# length 1
# 2
# Time elapsed 5.5e-05 seconds
# length 2
# 6
# Time elapsed 1.5e-05 seconds
# length 3
# 20
# Time elapsed 2.5e-05 seconds
# length 4
# 70
# Time elapsed 2.5e-05 seconds
# length 5
# 252
# Time elapsed 1.9e-05 seconds
# length 6
# 924
# Time elapsed 2.0e-05 seconds
# length 7
# 3432
# Time elapsed 2.3e-05 seconds
# length 8
# 12870
# Time elapsed 4.2e-05 seconds
# length 9
# 48620
# Time elapsed 6.1e-05 seconds
# length 10
# 184756
# Time elapsed 4.3e-05 seconds
# length 11
# 705432
# Time elapsed 0.000107 seconds
# length 12
# 2704156
# Time elapsed 6.7e-05 seconds
# length 13
# 10400600
# Time elapsed 7.9e-05 seconds
# length 14
# 40116600
# Time elapsed 8.7e-05 seconds
# length 15
# 155117520
# Time elapsed 9.2e-05 seconds
# length 16
# 601080390
# Time elapsed 9.1e-05 seconds
# length 17
# 2333606220
# Time elapsed 8.9e-05 seconds
# length 18
# 9075135300
# Time elapsed 0.0001 seconds
# length 19
# 35345263800
# Time elapsed 0.000149 seconds
# length 20
# 137846528820
# Time elapsed 0.000191 seconds
# /project_euler Philip$
