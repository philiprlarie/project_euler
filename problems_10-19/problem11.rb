# What is the greatest product of four 
# adjacent numbers in the same direction 
# (up, down, left, right, or diagonally) in the 20×20 grid?

line0 = '08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08'.split(' ').map {|number| number.to_i}
line1 = '49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00'.split(' ').map {|number| number.to_i}
line2 = '81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65'.split(' ').map {|number| number.to_i}
line3 = '52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91'.split(' ').map {|number| number.to_i}
line4 = '22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80'.split(' ').map {|number| number.to_i}
line5 = '24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50'.split(' ').map {|number| number.to_i}
line6 = '32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70'.split(' ').map {|number| number.to_i}
line7 = '67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21'.split(' ').map {|number| number.to_i}
line8 = '24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72'.split(' ').map {|number| number.to_i}
line9 = '21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95'.split(' ').map {|number| number.to_i}
line10 = '78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92'.split(' ').map {|number| number.to_i}
line11 = '16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57'.split(' ').map {|number| number.to_i}
line12 = '86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58'.split(' ').map {|number| number.to_i}
line13 = '19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40'.split(' ').map {|number| number.to_i}
line14 = '04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66'.split(' ').map {|number| number.to_i}
line15 = '88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69'.split(' ').map {|number| number.to_i}
line16 = '04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36'.split(' ').map {|number| number.to_i}
line17 = '20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16'.split(' ').map {|number| number.to_i}
line18 = '20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54'.split(' ').map {|number| number.to_i}
line19 = '01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48'.split(' ').map {|number| number.to_i}

lines = [line0, line1, line2, line3, line4, line5, line6, line7, line8, line9, line10, line11, line12, line13, line14, line15, line16, line17, line18, line19,]

def products_right(line)
	products = []
	how_many_nums = 4
	line_count = line.count
	i = 0

	while i + how_many_nums <= line_count
		product = 1
		for j in i..(i+how_many_nums-1)
			product *= line[j]
		end
		products << product
		i += 1
	end

	return products.max

end



def products_down(lines,col)
	products = []
	how_many_nums = 4
	lines_count = lines.count
	i = 0

	while i + how_many_nums <= lines_count
		product = 1
		for j in i..(i+how_many_nums-1)
			product *= lines[j][col]
		end
		products << product
		i += 1
	end

	return products.max

end

# p products_down([[4,4,4,4,4,4,4],[4,4,4,4,4,4,4],[4,4,4,4,4,4,4],[4,4,4,4,4,4,4],[4,4,4,4,4,4,4],[4,4,4,4,4,4,4],[4,4,4,4,4,4,4]],0)

def products_diag_right(lines)
	products = []
	how_many_nums = 4
	rows_count = lines.count
	cols_count  = lines[0].count
	col = 0
	row = 0

	while col + how_many_nums <= cols_count
		row = 0
		while row + how_many_nums <= rows_count
			product = 1
			for j in 0..(how_many_nums-1)
				product *= lines[row+j][col+j]
			end
			products << product
			row += 1
		end
		col += 1
	end

	return products.max

end


# p products_diag_right([[4,4,4,4,4,4,4],[4,0,4,4,4,4,4],[4,4,4,4,4,4,4],[4,4,4,4,4,4,4],[4,4,4,4,4,4,4],[4,4,4,4,4,4,4],[4,4,4,4,4,4,4]])


def products_diag_left(lines)
	products = []
	how_many_nums = 4
	rows_count = lines.count
	cols_count  = lines[0].count
	col = how_many_nums - 1
	row = 0

	while col < cols_count
		row = 0
		while row + how_many_nums <= rows_count
			product = 1
			for j in 0..(how_many_nums-1)
				product *= lines[row+j][col-j]
			end
			products << product
			row += 1
		end
		col += 1
	end

	return products.max

end

p products_diag_left([[4,4,4,4,4,4,0],[4,4,4,4,4,4,4],[4,4,4,4,4,4,4],[4,4,4,4,4,4,4],[4,4,4,4,4,4,4],[4,4,4,4,4,4,4],[4,4,4,4,4,4,4]])


products = []

products << products_diag_left(lines)

products << products_diag_right(lines)

lines.each {|line| products << products_right(line)}

col = 0
cols_count = lines[0].count
while col < cols_count
	products << products_down(lines,col)
	col += 1
end

p products.max







