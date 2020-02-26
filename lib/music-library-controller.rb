class MusicLibraryController
  def initialize(path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import()
  end
  
  def call()
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets
    while input != "exit" do
      input = gets
    end
  end
  
  def list_songs()
    sorted_songs = Song.all.sort do |a, b|
      a.name <=> b.name
    end
    
    sorted_songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists()
    sorted_artists = Artist.all.sort do |a, b|
      a.name <=> b.name
    end
    
    sorted_artists.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end
  
  def list_genres()
    sorted_genres = Genre.all.sort do |a, b|
      a.name <=> b.name
    end
    
    sorted_genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end
  
  def list_songs_by_artist()
    puts "Please enter the name of an artist:"
    input = gets
    if Artist.find_by_name(input) != nil
      artist = Artist.find_by_name(input)
      sorted_songs = artist.songs.sort do |a, b|
        a.name <=> b.name
      end
      sorted_songs.each_with_index do |song, index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end
  
  def list_songs_by_genre()
    puts "Please enter the name of a genre:"
    input = gets
    if Genre.find_by_name(input) != nil
      genre = Genre.find_by_name(input)
      sorted_songs = genre.songs.sort do |a, b|
        a.name <=> b.name
      end
      sorted_songs.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  
  def play_song()
    puts "Which song number would you like to play?"
  end
end