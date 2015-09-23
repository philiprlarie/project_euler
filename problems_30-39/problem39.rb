# If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.
#
# {20,48,52}, {24,45,51}, {30,40,50}
#
# For which value of p ≤ 1000, is the number of solutions maximised?

def is_right_triangle?(a, b, c)
  return true if a ** 2 + b ** 2 == c ** 2
  return true if c ** 2 + a ** 2 == b ** 2
  return true if b ** 2 + c ** 2 == a ** 2
  return false
end

def all_triangles(perimeter)
  triangles = []
  a = 1
  b = 1
  while a + b + b <= perimeter # c >= b
    c = perimeter - a - b
    while c >= b
      triangles << [a, b, c]
      b += 1
      c = perimeter - a - b
    end
    a += 1
    b = a
  end
  triangles
end

def num_right_triangles(perimeter)
  triangles = all_triangles(perimeter)
  triangles.count { |triangle| is_right_triangle?(*triangle) }
end

perimeters = {}
(3..1000).each do |perimeter|
  perimeters[perimeter] = num_right_triangles(perimeter)
end

p perimeters.max_by { |k, v| v }
