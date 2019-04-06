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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(song_name)
    self.all.find { |song| song.name == song_name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }.uniq
  end

  def self.new_from_filename(file_name)
    data = file_name.split(/[.-]/)
    artist = data[0].rstrip
    song = data[1].lstrip
    record = self.new
    record.artist_name = artist
    record.name = song
    record
  end

  def self.create_from_filename(file_name)
    data = file_name.split(/[.-]/)
    artist = data[0].rstrip
    song = data[1].lstrip
    record = self.new
    record.artist_name = artist
    record.name = song
    @@all << record
    record
  end

  def self.destroy_all
    self.all.clear
  end
end
