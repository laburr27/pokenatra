require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection.rb'

# Load specific routes / controllers
# require_relative 'controllers/artists.rb'

# Load models
require_relative 'models/pokemon'

get "/" do
  erb :index
end

# index
get "/pokemons" do
  @pokemons = Pokemon.all
  erb :"pokemons/index"
end

# new
get "/pokemons/new" do
  erb :"pokemons/new"
end

# create
post "/pokemons" do
  @pokemon = Pokemon.create!(params[:pokemon])
  redirect "pokemons/#{@pokemon.id}"
end

# show
get "/pokemons/:id" do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemons/show"
end

# edit
get "/pokemons/:id/edit" do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemons/edit"
end

# update
put "/pokemons/:id" do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.update(params[:pokemon])
  redirect "/pokemons/#{@pokemon.id}"
end

# delete
delete "/pokemons/:id" do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.destroy
  redirect "/pokemons"
end
