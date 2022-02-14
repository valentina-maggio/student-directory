File.open(File.basename($0), 'r') do |file|
  file.readlines.each do |line|
    puts line
  end
end