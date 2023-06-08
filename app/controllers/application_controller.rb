class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

   
  get '/' do
    books = Book.all
    books.to_json
  end

  get '/reviews' do
    reviews = Review.all
    reviews.to_json
  end
  
  post '/reviews' do
    review = Review.create(comment: params[:comment], user_id: params[:user_id], book_id: params[:book_id])
    review.to_json
  end

  get '/albums/:id' do
    album = album.find(params[:id])
    album.to_json
  end

  patch '/albums/:id' do
    album = Album.find(params[:id])
    album.update(comment: params[:comment])
    album.to_json
  end
  
  delete '/albums/:id' do
    album = Album.find(params[:id])
    album.destroy
    album.to_json
  end

  get '/songs/:id' do
   song = Song.find(params[:id])
    song.to_json
  end

  patch '/songs/:id' do
   song = Song.find(params[:id])
    song.update(
      name: params[:name],
      artist: params[:artist],
      description: params[:description],
      album: params[:album],
      producer: params[:producer]
    )
   song.to_json
  end

  delete '/song/:id' do
    song = Song.find(params[:id])
    song.destroy
    song.to_json
  end

  get '/users/:id' do
    user = User.find(params[:id])
    user.to_json
  end

  patch '/users/:id' do
    user = User.find(params[:id])
    user.update(
      username: params[:username],
      password: params[:password]
    )
    user.to_json
  end

  delete '/users/:id' do
    user = User.find(params[:id])
    user.destroy
    user.to_json
  end
  
    get '/songs' do
  
  songs.to_json(only: [:id, :name, :artist, :producer, :song_image])
end

end
