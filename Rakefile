require 'erb'
require 'rake/clean'

INFORMDIR = 'intermediates/TheNewMapmaker.inform'
MATERIALDIR = 'intermediates/TheNewMapmaker.materials'
BUILDDIR = INFORMDIR + '/Build'
SOURCEDIR = INFORMDIR + '/Source'
INDEXDIR = INFORMDIR + '/Index'

STORY_NI = INFORMDIR + '/Source/story.ni'
METADATA_FILE = INFORMDIR + '/Metadata.iFiction'
RELEASE_FILE = INFORMDIR + '/Release.blurb'

WIN_I7_BASE = "\"D:/Program Files (x86)/Inform 7"
WIN_I7_INTERNAL = WIN_I7_BASE + "/Internal\""
WIN_NI = WIN_I7_BASE + "/Compilers/ni\""
WIN_I6 = WIN_I7_BASE + "/Compilers/inform6\""
WIN_CBLORB = WIN_I7_BASE + "/Compilers/cBlorb\""

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

task :i6 => :ni do
  sh WIN_I6 + " -w~S~DG +include_path=..\\Source,.\\ " + BUILDDIR + "/auto.inf intermediates/TheNewMapmaker.inform/Build/output.ulx"
end

task :ifid => :ni do
  metadata = String.new
  metadata << File.read(METADATA_FILE)
  metadata.sub! '<ifid></ifid>', '<ifid>C0D363E1-4793-4709-BC0D-A81AFF401F08</ifid>'
  File.write(METADATA_FILE, metadata)
  rel = String.new
  rel << File.read(RELEASE_FILE)
  rel.sub! 'placeholder [IFID] = ""', 'placeholder [IFID] = "C0D363E1-4793-4709-BC0D-A81AFF401F08"'
  File.write(RELEASE_FILE, rel)
end

task :cBlorb => [:i6, :ifid] do
  sh WIN_CBLORB + " " + INFORMDIR + "/Release.blurb -windows " + BUILDDIR + "\output.gblorb"
end


CLEAN.include('intermediates/')
CLOBBER.include('intermediates/', 'out/')

task :default => [:cBlorb]