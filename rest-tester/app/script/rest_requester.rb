require 'rest-client'

input = ''
until input == "GET" || input == "POST"
  print "Enter a method: "
  input = gets.chomp.upcase
end

if input == "GET"
  print "Enter a parameter for localhost:3000 or press enter: "
  params = gets.chomp
  puts RestClient.get("localhost:3000#{params}")
elsif input == "POST"
  puts RestClient.post "localhost:3000/users", :params => "create"
end
