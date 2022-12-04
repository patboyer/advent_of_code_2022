scoreA = File.readlines('input/03_input.txt')
             .collect { |s| s.chomp } 
             .collect { |s| l = s.length; [ s[0, l/2], s[l/2, l] ] }
             .collect { |a| a.collect { |s| s.split(//) } }
             .collect { |a| a[0].intersection(a[1]) }
             .collect { |a| (a[0].ord >= 97) ? a[0].ord - 96: a[0].ord - 38 }
             .sum

scoreB = File.readlines('input/03_input.txt')
             .collect { |s| s.chomp } 
             .each_slice(3)
             .to_a
             .collect { |a| a.collect { |s| s.split(//) } }
             .collect { |a| a[0].intersection(a[1].intersection(a[2])) }
             .collect { |a| (a[0].ord >= 97) ? a[0].ord - 96: a[0].ord - 38 }
             .sum

puts "A: #{scoreA}"
puts "B: #{scoreB}"
