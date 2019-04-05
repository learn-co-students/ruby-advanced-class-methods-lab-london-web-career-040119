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
     self.all << song
     song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name) if !self.find_by_name(name)
    self.find_by_name(name)
  end

  def self.alphabetical
    sorted_instances = self.all.sort_by{|instance| instance.name}
    # names_array.sort
  end

  def self.format_filename(filename)
    f = filename.split('-')
    artist_name = f[0].strip
    name = f[1].strip.gsub('.mp3','')
    return [artist_name,name]
  end


  def self.new_from_filename(filename)

    # f = filename.split('-')
    # artist_name = f[0].strip
    # name = f[1].strip.gsub('.mp3','')
    song = self.new
    song.name = self.format_filename(filename)[1]
    song.artist_name = self.format_filename(filename)[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    self.all << song
  end


  def self.destroy_all
    self.all.clear
  end


end
