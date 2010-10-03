#!/opt/local/bin/ruby

input = String.new(ARGV[0])
arguments = []
while argument = input.match(/"(.*?)"/)
  arguments.push(input.match(/"(.*?)"/).captures.first)
  input.sub!(/"(.*?)"/, "<<var>>")

end

type = input.match(/^\s*(\w+)?/).captures.first

input.sub!(/^\s*(\w+)?\s/, '')

if arguments.length > 0
  print "#{type} /^" +
       input.gsub(/<<var>>/, '"([^\"]*)"').strip + '$/ do | ' +
       arguments.join(', ') + " |"
else
  print "#{type} /^" +
       input.gsub(/<<var>>/, '"([^\"]*)"').strip + '$/ do'
end

