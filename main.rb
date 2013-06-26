require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'open-uri'

get '/' do
  erb :home
end

get '/search' do
  url = "http://www.omdbapi.com/?s=#{URI.escape(params[:q])}"
  @results = JSON.load(open(url).read)
  @movies = @results["Search"]
  erb :result
end

get '/movie' do
  url = "http://www.omdbapi.com/?i=#{URI.escape(params[:id])}"
  @movie = JSON.load(open(url).read)
  erb :movie
end