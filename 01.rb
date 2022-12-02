require 'active_support/core_ext/array/grouping.rb'

elves = File.readlines('input/01_input.txt')
        	  .collect { |s| s.to_i }
					  .split(0)
					  .collect {|a| a.sum}

puts "A: #{elves.max}"
puts "B: #{elves.sort.reverse[0,3].sum}"

