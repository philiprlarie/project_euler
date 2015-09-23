
def is_pandigital_str?(str)
  return false unless str.length == 9
  return false if str.include?("0")
  return false unless str.split("").uniq.length == 9
  true
end

pan_digitals = []
(1..1000000).each do |test_base|
  (1..9).each do |len|
    digital = (1..len).inject("") { |str, num| str + (num * test_base).to_s }
    break if digital.length > 9
    pan_digitals << digital if is_pandigital_str?(digital)
  end
end

p pan_digitals.max
