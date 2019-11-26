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

  def self.new_by_name name
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name name
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name name
    all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name name
    if !find_by_name name
      create_by_name name
    else
      find_by_name name
    end
  end

  def self.alphabetical
    all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename name
    stupid = name.split(".mp3").join.split(" - ")
    song = Song.new
    song.artist_name = stupid[0]
    song.name = stupid[1]
    song
  end

  def self.create_from_filename name
    song = new_from_filename name
    song.save
  end

  def self.destroy_all
    all.clear
  end

end
