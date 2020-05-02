# =begin
# word = ARGV[0].split('') #SPLIT PERMET DE CONVERTIR UN MOT EN UN TABLEAU.
# i = 0  #i TRAVERSERA LE MOT INPUT ET DIRA QUEL LETTRE METTRE EN MAJ OU EN MINISCULE
#
# while i < word.length #TANT QUE i N'A PAS TRAVERSÉ WORD JUSQU'AU BOUT, IL ITÉRERA
#   if i % 2 == 0
#     print word[i].upcase
#   else
#     print word[i].downcase
#   end
#   i += 1 #i PRENDRA TOUJOURS 1 POUR QUE MODULO FASSE UN RÉSULTAT DE 1 OU 0 POUR LES MAJ ET MIN
# end
#
#  print "\n" #PERMET DE NE PAS AVOIR DE % À LA FIN DU RÉSULTAT SANS DEVOIR METTRE PUTS


# Entrez x : 23
# #Entrez y : 12
# #L’échange a été effectué : x vaut 12 et y vaut 23.
#  puts "Entrez un chiffre"
#  chiffre_a = gets.chomp
#  puts "Entrez un second chiffre"
#  chiffre_b = gets.chomp
#
# tmp = chiffre_a
# chiffre_a = chiffre_b
# chiffre_b = tmp
#
# puts "L'échange a été effectué, le premier chiffre vaut #{chiffre_a} et le second vaut #{chiffre_b}"

# flag = true
#
# while flag
#   flag = false
#   i = 0
#   while (i < ARGV.length() - 1)
#     if (ARGV[i] < ARGV[i + 1])
#       tmp = ARGV[i]
#       ARGV[i] = ARGV[i + 1]
#       ARGV[i + 1] = tmp
#       flag = true
#     end
#     i += 1
#    end
# end
#
# puts ARGV.join(' ')

def welcome
    puts "Hello ! Welcome on my newest game !!"
end

def multiply(nb1, nb2)
    nb1 * nb2.to_i
end

def divid(nb1, nb2)
    nb1 - nb2.to_i
end


welcome

puts "choose a number : "
nb1 = gets.chomp
puts "Choose a second number : "
nb2 = gets.chomp
puts "number one is #{nb1}, number two is #{nb2}"

puts "Make a choice, 1) Multiply, 2) Divid : "
choice = gets.chomp.to_i


if choice == 1
    puts "The result of #{nb1} multiplyed by #{nb2} = #{multiply(nb1, nb2)}"
elsif choice == 2
    puts "The result of #{nb1} divided by #{nb2} = #{divided(nb1, nb2)}"
else
    puts "Undefined choice, please try again"
end
