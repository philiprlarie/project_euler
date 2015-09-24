def generate_new_pents(pents, pent_values, i, j)
  k = pents.length - 1
  until pents.last >= pents[i] + pents[j]
    k += 1
    pents << k * (3 * k - 1) / 2
    pent_values[k * (3 * k - 1) / 2] = true
  end
end

pents = [1, 5]
pent_values = { 1 => true, 5 => true }
j = 1

while true
  p j
  i = j - 1
  unless pents.last >= pents[i] + pents[j]
    generate_new_pents(pents, pent_values, i, j)
  end
  while i >= 0
    if pent_values[pents[j] + pents[i]] &&
      pent_values[pents[j] - pents[i]]
      answer = pents[j] - pents[i]
      break
    end
    i -= 1
  end
  break if !!answer
  j += 1
end

p answer
