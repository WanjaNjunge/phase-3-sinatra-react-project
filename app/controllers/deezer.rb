require 'uri'
require 'net/http'

url = URI("https://deezerdevs-deezer.p.rapidapi.com/search?q=eminem")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = '52cdfd2aa8msh3e4ac78fc021f31p1b238fjsnc431c9ac3507'
request["X-RapidAPI-Host"] = 'deezerdevs-deezer.p.rapidapi.com'

response = http.request(request)
puts response.read_body