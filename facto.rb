res = []
c1 = File.foreach([ARGV[0]) { |line| res[i] = []; tab[i] += line.chomp.split(''); i += 1}

tab = []
c2 = File.foreach([ARGV[1]) { |line| tab[i] = []; tab[i] += line.chomp.split(''); i += 1}

y = 0  #| index de l index TAB 
x = 0  #| index TAB 
a = 0  #|
b = 0  #|

while x < tab.length do
  y = 0
   while (y < tab[x].length)
     if res[0][0] == tab[x][y]
        print 'ok'

     end 
     y += 1

   end
  x += 1
end