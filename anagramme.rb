
value = ARGV[0]
file_word_find = ARGV[1]


word_on_array = []
position = 0

File.foreach(file_word_find) { |line| word_on_array[position] =  line.chomp; position += 1}


 i = 0
 while( i < word_on_array.length)
    if (word_on_array[i].split('').sort.join('') == value.split('').sort.join(''))
        puts word_on_array[i]
    end
    i += 1
end


