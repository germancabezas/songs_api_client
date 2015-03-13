
class Song

  attr_reader :name, :band  # this just retursn the value we describe within the method like if we would be doing

  #def name
  # return @name  ====> we bring our instance variables form below
  #end

  def initialize(hash)
    @name = hash["name"]
    @band = hash["band"]
  end

  def self.find(id)
    song_hash = Unirest.get("http://localhost:3000/songs/#{id}.json").body
    return Song.new(song_hash)
  end

  def self.all 
    songs_array = Unirest.get("http://localhost:3000/songs.json").body["songs"]
    songs = []
    songs_array.each do |song|
      songs << Song.new(song)
    end
    return songs


  end 


end

