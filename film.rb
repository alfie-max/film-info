require 'httparty'
require 'json'
require 'nokogiri'

film = gets.chomp
url = "http://www.omdbapi.com/?t=" + film +"&y=&plot=short&r=json"

response = HTTParty.get(url)

@doc = File.open("sample.html") { |f| Nokogiri::HTML(f) }

title  = @doc.at_css "title"
h1  = @doc.at_css "h1"
poster  = @doc.at_css "#poster"

h1.content = response['Title']
title.content = response['Title']
poster[:src] = response['Poster']

File.write("#{response["Title"]}.html", @doc.to_html)
