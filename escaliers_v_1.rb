# movies =
# {anchoix: "James Bond",
# remix: 1233,
# wallah: "ta gueule"
# }



# puts movies[:anchoix]
# puts movies[:remix]
# puts movies[:wallah]

stairs = ARGV[0].to_i
i = 0

while i < stairs
  puts (' ' * stairs - i - 1)
  print ('#' * i + 1)
  print "\n"
  i += 1
end
