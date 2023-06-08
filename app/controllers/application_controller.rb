class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # Add your routes here
  get '/' do
    url = URI("https://deezerdevs-deezer.p.rapidapi.com/search?q=evanescence")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request["X-RapidAPI-Key"] = '52cdfd2aa8msh3e4ac78fc021f31p1b238fjsnc431c9ac3507'
  request["X-RapidAPI-Host"] = 'deezerdevs-deezer.p.rapidapi.com'

  response = http.request(request)
  
  content_type :json
  response.read_body
  end
end