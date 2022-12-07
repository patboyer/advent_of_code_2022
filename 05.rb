lines = File.readlines('input/05_input.txt')
            .collect { |s| s.chomp }

num_stacks = lines[0].scan(/....|.../).length
stacks = Array.new(num_stacks) { Array.new }

# create stacks
lines.select { |s| s.match(/\[/) }.each do |line|
  line.scan(/....|.../).each_with_index do |section, idx|
    c = section.gsub(/[^A-Z]/, '')
    stacks[idx] << c[0] if c.length > 0
  end
end

# move boxes
lines.select { |s| s.match(/move/) }.each do |line|
  (n, src, dst) = line.match(/move (\d+) from (\d+) to (\d+)/)
                      .captures
                      .collect { |s| s.to_i }
  n.times { |i| stacks[dst-1].unshift(stacks[src-1].shift) } 
end

top_crates = stacks.collect { |stack| stack[0] || '' }.join('')

puts "A: #{top_crates}"

#----- Part B -----
stacks = Array.new(num_stacks) { Array.new }

# create stacks
lines.select { |s| s.match(/\[/) }.each do |line|
  line.scan(/....|.../).each_with_index do |section, idx|
    c = section.gsub(/[^A-Z]/, '')
    stacks[idx] << c[0] if c.length > 0
  end
end

# move boxes
lines.select { |s| s.match(/move/) }.each do |line|
  (n, src, dst) = line.match(/move (\d+) from (\d+) to (\d+)/)
                      .captures
                      .collect { |s| s.to_i }

  boxes = stacks[src-1].slice!(0, n)
  stacks[dst-1] = boxes.concat(stacks[dst-1])
end

top_crates = stacks.collect { |stack| stack[0] || '' }.join('')

puts "B: #{top_crates}"
