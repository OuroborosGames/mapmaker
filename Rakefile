require 'erb'
require 'rake/clean'

directory 'intermediates'
directory 'intermediates/The New Mapmaker.materials'
directory 'intermediates/The New Mapmaker.inform'
directory 'intermediates/The New Mapmaker.inform/Build'
directory 'intermediates/The New Mapmaker.inform/Index'
directory 'intermediates/The New Mapmaker.inform/Source'

STORY_NI = 'intermediates/The New Mapmaker.inform/Source/story.ni'

desc "Create Inform 7 source code from template"
file STORY_NI => ['intermediates/The New Mapmaker.inform/Source'] do
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
  
  File.write(STORY_NI, ERB.new(template).result)

end

CLEAN.include('intermediates/')
CLOBBER.include('intermediates/', 'out/')

task :default => [STORY_NI]