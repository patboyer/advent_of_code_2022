signal = File.read('input/06_input.txt').chomp

marker =  (0..signal.length-4).select  { |i| signal[i, 4].split(//).uniq.length == 4 }.first + 4
message = (0..signal.length-14).select { |i| signal[i, 14].split(//).uniq.length == 14 }.first + 14

puts "A: #{marker}"
puts "A: #{message}"
