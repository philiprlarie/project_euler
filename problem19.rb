# day 0 is tuesday, january 1st 1901
MONTHS = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
LEAP_YEAR = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
day = 0
count = 0

(1901..2000).each do |year|
  if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
    LEAP_YEAR.each do |month|
      day += month
      count += 1 if day % 7 == 5
    end
  else
    MONTHS.each do |month|
      day += month
      count += 1 if day % 7 == 5
    end
  end
end

p count
