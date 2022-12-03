scoreA = File.readlines('input/02_input.txt')
             .collect { |s| s.chomp }
             .collect { |s| s.gsub(/\s+/, '') }
             .collect do |s|
               case s 
               when 'AX' then 4 # tie
               when 'AY' then 8 # (plr) rock < paper
               when 'AZ' then 3 # (elf) rock > scissors
               when 'BX' then 1 # (elf) paper > rock
               when 'BY' then 5 # tie
               when 'BZ' then 9 # (plr) paper < scissors
               when 'CX' then 7 # (plr) scissors < rock
               when 'CY' then 2 # (elf) scissors > paper
               when 'CZ' then 6 # tie
               end
             end
             .sum

scoreB = File.readlines('input/02_input.txt')
             .collect { |s| s.chomp }
             .collect { |s| s.gsub(/\s+/, '') }
             .collect do |s|
               case s 
               when 'AX' then 3 # lose: 'AZ'
               when 'AY' then 4 # draw: 'AX'
               when 'AZ' then 8 # win:  'AY'
               when 'BX' then 1 # lose: 'BX'
               when 'BY' then 5 # draw: 'BY'
               when 'BZ' then 9 # win:  'BZ'
               when 'CX' then 2 # lose: 'CY'
               when 'CY' then 6 # draw: 'CZ'
               when 'CZ' then 7 # win:  'CX'
               end
             end
             .sum

puts "A: #{scoreA}"
puts "B: #{scoreB}"
