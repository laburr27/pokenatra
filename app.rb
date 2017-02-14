require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection.rb'

# Load specific routes / controllers
# require_relative 'controllers/artists.rb'

# Load models
require_relative 'models/pokemon'


# index
get "/pokemons" do
  @pokemons = Pokemon.all
  erb :"pokemons/index"
end



# new

# create

# show
get "/pokemons/:id" do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemons/show"
end

# edit

# update

# destroy
