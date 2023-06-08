require 'uri'
require 'net/http'

puts "Deleting old playlist..."


User.destroy_all

# auto-increment sequence for User table reset
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name = 'users'")
# auto-increment sequence for song table reset
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name = 'song'")

puts "Seeding ..."


url = URI("https://deezerdevs-deezer.p.rapidapi.com/genre/%7Bid%7D")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = '41112049c4msh59b5de37364f78ep1b8cc1jsna62ce0f490c3'
request["X-RapidAPI-Host"] = 'deezerdevs-deezer.p.rapidapi.com'

response = http.request(request)
puts response.read_body


if response.code == "200"
  data = JSON.parse(response.body)
  
  if data["status"] == "OK"
    songs = data["results"]["songs"]


    songs.each do |song|
        # Create album
        new_album = song.create(
          title: song["name"],
          artist: song["artist"],
          book_image: song["song_image"],
          description: song["description"]
        )
      
        # Create a review for each album
        new_album.reviews.create(
          comment: "This album is dope!",
          user: User.create(
            name: Faker::Name.name,
            email: Faker::Internet.email
          )
        )
      end

      

    
  else
    puts "API request failed"
  end
else
  puts "Failed to connect to the API"
end
puts "Done seeding."





# Define a route that handles the update request
put '/update_data' do
  begin
    # Parse the request body as JSON
    request.body.rewind
    data = JSON.parse(request.body.read)


    # Return a success response

    status 200
    body "Data updated successfully"
  rescue JSON::ParserError => e
    # Return a bad request response if the request body is not valid JSON
    status 400
    body "Invalid request body: #{e.message}"
  rescue => e
    # Log and return a server error response if an error occurs

    puts "Error updating data: #{e.message}"
    status 500
    body "Error updating data"
  end
end