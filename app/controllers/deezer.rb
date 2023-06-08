require 'sinatra'
require 'net/http'
require 'json'

get '/' do
  erb :index
end

post '/search' do
  request_body = JSON.parse(request.body.read)
  search_term = request_body['searchTerm']

  url = URI("https://deezerdevs-deezer.p.rapidapi.com/search?q=#{search_term}")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request['X-RapidAPI-Key'] = 'YOUR_API_KEY'
  request['X-RapidAPI-Host'] = 'deezerdevs-deezer.p.rapidapi.com'

  response = http.request(request)
  
  content_type :json
  response.body
end