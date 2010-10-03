#!/opt/local/bin/ruby

ignore_words = ['i', 'and', 'the', 'agent', 'we', 'a', 'an', 'see', 'will', 'is', 'should', 'be', 'on', 'page']

input = ARGV[0]
all_step_files = `find features/step_definitions | grep '.rb'`
all_step_files = all_step_files.split("\n")
words = input.split(' ')

ignore_words.each do | word |
  words.each do | keyword |
    words.delete(keyword) if keyword.downcase == word
  end
end

files = {}
all_step_files.each do | file |
  file_name = file.split('/').last
  files[file] = {}
  files[file][:file_name_match_count] = 0
  files[file][:word_count] = 0
  words.each do | word |
    files[file][:file_name_match_count] += 1 if file_name.downcase.match(word.downcase)
    next if word.downcase == 'given' || word.downcase == 'then' || word.downcase == 'when'

    word_count = `grep #{word} #{file} | wc -l`
    files[file][:word_count] += word_count.to_i
  end
end

sorted_files = files.keys.sort { |a, b|
  if files[a][:file_name_match_count] == files[b][:file_name_match_count]
    files[b][:word_count] <=> files[a][:word_count]
  else
    files[b][:file_name_match_count] <=> files[a][:file_name_match_count]
  end
}

puts sorted_files
