pairs = File.readlines('input/04_input.txt')
            .collect { |s| s.chomp }
            .collect { |s| s.split(/,/) }
            .collect { |a| a.collect { |s| s.split(/-/) } }
            .collect { |a| a.collect { |a2| (a2[0].to_i .. a2[1].to_i).to_a } }
            
overlapsA = pairs.select { |p| (p[0]-p[1]).length == 0 || (p[1]-p[0]).length == 0}
                 .count

overlapsB = pairs.select { |p| (p[0]-p[1]).length < p[0].length || (p[1]-p[0]).length < p[1].length}
                 .count

puts "A: #{overlapsA}"
puts "B: #{overlapsB}"
