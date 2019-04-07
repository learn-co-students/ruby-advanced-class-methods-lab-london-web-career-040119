require 'pry'

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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(title)
    song = Song.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = Song.new
    song.name = title
    song.save
    song
  end

  def self.find_by_name(title)
    @@all.find{|song| song.name == title}
  end

  def self.find_or_create_by_name(title)
    self.find_by_name(title) || self.create_by_name(title)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file_name)
    song = Song.new
    arr = file_name.gsub(".mp3", "")
    song.artist_name = arr.split(" - ")[0]
    song.name = arr.split(" - ")[1]
    song
  end

  def self.create_from_filename(file_name)
    song = Song.new_from_filename(file_name)
    song.save
  end

  def self.destroy_all
    @@all.clear
  end

end
