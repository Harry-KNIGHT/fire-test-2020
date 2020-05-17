=begin puts "Si j'étais en vacances, j'irais à : "

voyage = [
  { ville: "Paris", duree: 10},
  { ville: "New York", duree: 17 },
  { ville: "Berlin", duree: 12 },
  { ville:"Montréal", duree: 4 }
]

voyage.each do |voyage|
  puts "Voyage à #{voyage[:ville]}, pendant #{voyage[:duree]} jours "
=end


"Use the each method of Array to iterate over [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], and print out each value"


array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

array.each {|numbers| print numbers if numbers > 5 }
