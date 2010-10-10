#!/opt/local/bin/ruby

file  = ARGV[0]
file = File.new(file, 'r')

while(line = file.gets)
  next unless line.match('^When') || line.match('^Then') || line.match('^Given')
  line.gsub!('/^', '')
  line.gsub!('$/', '')
  line.gsub!(/"\(\[\^"\]\*\)?"/, '<var>')
  line.gsub!(/"\(\[\^\\"\]\*\)?"/, '<var>')
  line.gsub!(/'\(\\d\+\)'/, '<var>')

  if line.match('\|.*\|')
    vars = line.match(/\|(.*)\|/).captures.first
    vars = vars.split(',')

    while line.match('<var>') && vars.length > 0
      line.sub!('<var>', "\"<#{vars.shift}>\"")
    end
  end
  line.sub!(/\sdo(\s+\|.*)?$/, '')
  puts line
end
