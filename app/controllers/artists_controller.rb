

class ArtistsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/artists' do
    erb :"artists/index"
  end

  get '/artists/new' do
    erb :'artists/new'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'artists/show'
  end
end
