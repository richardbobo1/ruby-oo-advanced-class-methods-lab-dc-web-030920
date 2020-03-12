require 'pry'

class Song

  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new 
    song.save 
    song 
  end 

  def self.new_by_name(song_name)
    song = self.new 
    song.name = song_name 
    song 
  end 

  def self.create_by_name(song_name)
    song = self.create    ##uses self.create method to create and save
    song.name = song_name  #sets name 
    song 
  end 

  def self.find_by_name(name) 

    self.all.find {|song| song.name == name }

  end 

  def self.find_or_create_by_name(name) 
    self.find_by_name(name) || self.create_by_name(name) 
  end 

  def self.alphabetical 
    
    Song.all.sort_by {|song| song.name }

  end 


  def self.new_from_filename(filename)
  
      split_file = filename.split(" - ")
      second_split = split_file[1].split(".")
    
      song = self.new 
      song.name = second_split[0]
      song.artist_name = split_file[0] 
      song
  
  end 

  def self.create_from_filename(filename)
  
    split_file = filename.split(" - ")
    second_split = split_file[1].split(".")
  
    song = self.create 
    song.name = second_split[0]
    song.artist_name = split_file[0]
    song

end 

  def self.destroy_all
    self.all.clear 
  end 


  def self.all
     @@all 
  end

  def save

    self.class.all << self
  end

end
