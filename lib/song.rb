require "pry"

class Song

  attr_accessor :name, :artist_name

  @@all = []

  # def initialize(name, artist_name)
  #   @name = name
  #   @artist_name = artist_name
  # end

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

  def self.new_by_name(new_song)
    song = self.new
    song.name = new_song
    song
  end

  def self.create_by_name(new_song)
    song = self.new
    song.name = new_song
    song.save
    song
  end

  def self.find_by_name(song_to_find)
    self.all.find{|each_song| each_song.name == song_to_find}
  end

  def self.find_or_create_by_name(song_name)
    self.create_by_name(song_name)
    self.find_by_name(song_name)
  end


  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end


  def self.new_from_filename(file_name)
    parts = file_name.split(" - ")
    artist = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist
    song
  end


  def self.create_from_filename(file_name)
    new_song_and_artist = self.new_from_filename(file_name)
    new_song_and_artist.save
  end


  def self.destroy_all
    self.all.clear
  end


end
