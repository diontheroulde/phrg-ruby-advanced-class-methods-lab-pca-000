require "pry"

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

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    song = @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = find_by_name(name)
    song ? song : create_by_name(name)
  end

  def self.alphabetical
    @@all.sort {|song_a, song_b| song_a.name <=> song_b.name}
  end

  def self.new_from_filename(song)
    parsed_song = song.split(/\ - |\./)
    new_song = self.new
    new_song.name = parsed_song[1]
    new_song.artist_name = parsed_song[0]
    new_song
  end

  def self.create_from_filename(song)
    parsed_song = song.split(/\ - |\./)
    new_song = self.new
    new_song.name = parsed_song[1]
    new_song.artist_name = parsed_song[0]
    @@all << new_song
    new_song
  end

  def self.destroy_all
    @@all = []
  end
end
