
class SongController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/songs' do
    erb :'songs/index'
  end

  post '/songs' do
  
    genre = Genre.find_by(name: params['genre']['name'])
    song_genre = SongGenre.find_or_create_by(genre_id: genre.id)
    artist = Artist.find_or_create_by(name: params['artist']['name'])
    song = Song.find_or_create_by(name: params["Name"], artist_id: artist.id)
    song_genre.song_id = song.id
    binding.pry
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

end
