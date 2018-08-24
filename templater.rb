require 'erb'

template = String.new

Dir['src/defs/*'].each  do |f|
  if File.file? f
    template << File.read(f)
  end
end

Dir['src/ni/*'].each  do |f|
  if File.file? f
    template << File.read(f)
  end
end

print ERB.new(template).result