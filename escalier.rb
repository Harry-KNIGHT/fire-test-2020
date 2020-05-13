space = ARGV[0].to_i
hash = 0

space.times { space -= 1; hash += 1; print " " * space + "#" * hash; print "\n"}


