class MusicImporter
  attr_accessor(:path)
  
  def initialize(path)
    @path = path
  end
  
  def import()
    self.files.each do |file|
      Song.crea
  end
  
  def files()
    filenames =  Dir.entries(@path).select do |file|
      file.include?(".mp3")
    end
    
    return filenames
  end
  
end