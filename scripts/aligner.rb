#!/usr/bin/ruby

def align text, char
  matrix = []
  lines = text.split("\n")
  indent = 0

  lines.each_index do |line_index|
    matrix[line_index] = []

    # padding one space at the end to book a space in case
    # the string end with the char
    # this is because "|a|b|c|".split('|')
    #  => ["", 'a', 'b', 'c']
    lines[line_index] += ' '
    parts = lines[line_index].split(char)

    parts.each_index do |part_index|
      value = parts[part_index]

      if line_index == 0 && part_index == 0
        indent = value.match(/(^\s*)/).captures.first
      end

      value.gsub!(/\s+$/,'')
      value.gsub!(/^\s+/,'')

      matrix[line_index][part_index] = value
    end
  end

  return format(matrix, indent, char)
end

def format matrix, indent, char
  formated_lines = []
  matrix.each do |line|
    line.each_index do |index|
      line[index] = padding(line[index], max_length(matrix, index))
    end

    if char == ':'
      line = line.join(" #{char}")
    else
      line = line.join(" #{char} ")
    end

    line.sub!(/\s*$/, '')
    line.sub!(/^\s*/, '')
    formated_lines.push(indent + line)
  end

  return formated_lines.join("\n")
end

def max_length matrix, index
  max_length = 0

  matrix.each do |line|
    next if line.length <= index;
    max_length = line[index].length if line[index].length > max_length
  end
  return max_length
end

def padding value, length

  while length - value.length > 0
    value = value + ' '
  end

  return value
end

char  = ARGV[0]
input = ARGV[1]

if input == '-'
  text = STDIN.read
else
  text  = File.read(input)
end

puts align(text, char)
