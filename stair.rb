a = 0..10
a = a.to_a


a.each {|number| puts "#{number} Is smaller than 5" if number < a[5]}