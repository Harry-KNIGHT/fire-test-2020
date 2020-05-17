maj = ARGV[0].split('')
i = 0

while i < maj.length
    if i % 2 == 0
    print maj[i].downcase
  else
    print maj[i].upcase
  end
  i += 1
end
print "\n"
