require 'pp'

class FileObject
  attr_reader :name, :type, :parent, :size, :children

  TYPE_FOLDER = 0
  TYPE_FILE   = 1

  def initialize(name, type, parent=nil, size=nil)
    @name     = name 
    @type     = type
    @parent   = parent 
    @size     = size
    @children = []
  end
  
  def has_child?(target)
    @children.select { |n| n.name == target }.first || nil
  end

  def total_size
    if @type == TYPE_FOLDER 
      children.collect { |n| n.total_size }.sum
    else
      @size
    end
  end
end

lines = File.readlines('input/07_input.txt')
            .collect { |line| line.chomp }

root = FileObject.new('/', FileObject::TYPE_FOLDER)

current = root 
folders = []

lines.each do |line|
  fields = line.split(/\s+/)

  if fields[0] == '$'
    if fields[1] == 'cd' and fields[2] == '..'
      current = current.parent
    elsif fields[1] == 'cd' and fields[2] == '/'
      current = root
    elsif fields[1] == 'cd' 
      target = current.has_child?(fields[2])

      if target
        current = target
      else
        puts fields[2]
        new_folder = FileObject.new(fields[2], FileObject::TYPE_FOLDER, current)
        current.children << new_folder 
        current = new_folder
        folders << new_folder
      end
    end
  else
    unless current.has_child?(fields[1])
      if (fields[0] == 'dir')
        child = FileObject.new(fields[1], FileObject::TYPE_FOLDER, current)
        folders << child
      else 
        child = FileObject.new(fields[1], FileObject::TYPE_FILE, current, fields[0].to_i)
      end

      current.children << child
    end
  end
end

solveA = folders.collect { |n| n.total_size }
                .select  { |n| n <= 100000 }
                .sum

total_disk_space = 70000000
unused_disk_space = total_disk_space - root.total_size 
size_to_delete = 30000000 - unused_disk_space

solveB = folders.collect { |n| n.total_size }
                .select  { |n| n >= size_to_delete }
                .sort
                .first

puts "A: #{solveA}"
puts "B: #{solveB}"
