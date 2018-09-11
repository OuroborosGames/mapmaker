require 'erb'
require 'rake/clean'

INFORMDIR = 'intermediates/TheNewMapmaker.inform'
MATERIALDIR = 'intermediates/TheNewMapmaker.materials'
BUILDDIR = INFORMDIR + '/Build'
SOURCEDIR = INFORMDIR + '/Source'
INDEXDIR = INFORMDIR + '/Index'

STORY_NI = INFORMDIR + '/Source/story.ni'

WIN_I7_BASE = "\"D:/Program Files (x86)/Inform 7"
WIN_I7_INTERNAL = WIN_I7_BASE + "/Internal\""
WIN_NI = WIN_I7_BASE + "/Compilers/ni\""

directory 'intermediates'
directory MATERIALDIR
directory INFORMDIR
directory BUILDDIR
directory SOURCEDIR
directory INDEXDIR

desc "Create Inform 7 source code from template"
file STORY_NI => [SOURCEDIR] do
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

task :ni => [INDEXDIR, MATERIALDIR, STORY_NI] do
  sh WIN_NI + " -release -internal " + WIN_I7_INTERNAL + " -project " + INFORMDIR + " -format=ulx"
end

CLEAN.include('intermediates/')
CLOBBER.include('intermediates/', 'out/')

task :default => [:ni]