class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new #self here can be self or Song as they are the same
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.find { |song| song.name == song_name}
  end

  #Heres a better method
  #self.find_by_name(song_name) || self.create_by_name(song_name)
  def self.find_or_create_by_name(song_name)
    if find_by_name(song_name)
      find_by_name(song_name)
    else
      create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  #Complete name is like Outkast - Hey ya.mp3. This function seperates that
  #By - and then takes the first half as the artsists and the second half
  #As the song using gsub to replace all mp3's with 'nothings in this case'
  def self.new_from_filename(complete_name)
    parts = complete_name.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(complete_name)
    parts = complete_name.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
