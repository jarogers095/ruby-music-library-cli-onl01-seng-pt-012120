class Song
  @@all = []
  attr_accessor(:name)
  attr_reader(:artist, :genre)
  
  def initialize(name, an_artist = nil, a_genre = nil)
    @name = name
    self.artist=(an_artist)
    self.genre=(a_genre)
  end
  
  def self.all()
    return @@all
  end
  
  def self.destroy_all()
    @@all.clear
  end
  
  def self.create(name)
    new_song = Song.new(name)
    @@all << new_song
    return new_song
  end
  
  def self.find_by_name(name)
    return @@all.detect do |song|
      song.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    if Song.find_by_name(name) == nil
      new_song = Song.create(name)
      return new_song
    else
      return Song.find_by_name(name)
    end
  end
  
  def self.new_from_filename(filename)
    split_filename = filename.split(" - ")
    artist_name = split_filename[0]
    song_name = split_filename[1]
    genre_name = split_filename[2]
    new_song = Song.new(song_name, artist_name, genre_name)
    
    return new_song
  end
  
  def self.create_from_filename()
    
  end
  
  def save()
    @@all << self
  end
  
  def artist=(an_artist)
    if @artist == nil && an_artist != nil
      @artist = an_artist
      an_artist.add_song(self)
    end
  end
  
  def genre=(a_genre)
    if @genre == nil && a_genre != nil
      @genre = a_genre
      a_genre.add_song(self)
    end
  end
end