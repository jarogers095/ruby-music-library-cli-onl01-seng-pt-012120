class MusicLibraryController
  attr_accessor(:path)
  
  def initialize(path = "./db/mp3s")
    @path = path
  end
  
  def call()
    
  end
end