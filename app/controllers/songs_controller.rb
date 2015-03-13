class SongsController < ApplicationController

  def index
    @songs = Song.all

    #when we get an error but our controller has run we can debug by printing to the console what we are getting.
    # like thi :   p @songs    then you can see that what we are getting is a hash. that way we know what the structure of our data looks like and then we can call it like above after .body["songs"] in this case the api we created is giving us a hash.
    # p @songs
  end

  def show
    @song = Song.find(params[:id])
  end


  def new
  end

  def create
      @song = Unirest.post("http://localhost:3000/songs.json", :headers => {"Accept" => "application/json"}, :parameters => {:name => params[:name]}).body
      p @song
      redirect_to "/songs/#{@song['id']}"

  end

end










