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
    @@all << song
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(title)
    result = self.all.detect {|song| song.name == title}
    result
  end

  def self.find_or_create_by_name(title)
   self.find_by_name(title) || self.create_by_name(title)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
   row = filename

      data = row.split(" - ")
      artist_name = data[0]
      song_name = data[1].gsub(".mp3", "")

     song = self.new
     song.name = song_name
     song.artist_name = artist_name
     song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

 def song.destroy_all
  @@all.clear
 end

 end
