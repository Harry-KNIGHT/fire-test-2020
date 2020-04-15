space = ARGV[0].to_i
tag = 0

space.times do
  space -= 1
  tag += 1
  print (" " * space + "#" * tag)
  print "\n"
end
