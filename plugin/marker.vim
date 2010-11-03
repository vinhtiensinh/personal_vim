if !has('ruby')
  finish
endif

ruby << EOF
  # require Ruby files
  VIM::evaluate('&runtimepath').to_s.split(',').each do |path|
    if File.exist?("#{path}/ruby/marker")
      require "#{path}/ruby/marker/marker.rb"
    end
  end
EOF
