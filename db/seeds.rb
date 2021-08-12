# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Movie.destroy_all
require 'json'
require 'open-uri'

url = 'http://tmdb.lewagon.com/movie/top_rated'
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)
movie_array = []
movies["results"].each do |movie|
  film = {
    title: movie['title'],
    overview: movie['overview'],
    rating: movie['vote_average'],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}"
    }
  movie_array << film
end

movie_array.each do |movie|
  p movie[:poster_url]
  Movie.create(movie)
  # film = Movie.new(movie)
  # film.save
end
