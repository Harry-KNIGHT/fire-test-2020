stairs = ARGV[0].to_i
i = 0

while i < stairs
  puts (' ' * stairs - i - 1)
  print ('#' * i + 1)
  print "\n"
  i += 1
end
