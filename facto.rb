def facto(n)
  if n < 1
    return 1
  end
    return n * facto(n - 1)
end

number = ARGV[0].to_i
puts facto(number)
