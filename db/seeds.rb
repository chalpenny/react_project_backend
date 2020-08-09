# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Product.delete_all

# products = Product.create(
#     {
#         name: "Death Star",
#         model: "DS-1 Orbital Battle Station",
#         manufacturer: "Imperial Department of Military Research, Sienar Fleet Systems",
#         cost_in_credits: 1000000000000,
#         length: 120000,
#         max_atmosphering_speed: 'n/a',
#         crew: 342953,
#         passengers: 843342
#     }
    # ,
    # {    name: "X-wing",
    #     model: "T-65 X-wing",
    #     manufacturer: "Incom Corporation",
    #     cost_in_credits: 149999,
    #     length: 12.5,
    #     max_atmosphering_speed: 1050,
    #     crew: 1,
    #     passengers: 0
    # }
# )
require 'open-uri'
require 'json'


# def populate_starships(url)
#     data = open(url).read
#     JSON.parse(data)

    # if !json.nil?
    #     json["data"].map do |starship|
    #         binding.pry
    #         Product.create(name: "{starship.name}")
    #     end
    # else
    #     puts "error seeding ships"
    # end
# end

# populate_starships('https://swapi.dev/api/starships')



url = 'https://swapi.dev/api/starships'

uri = URI.parse(url)
tries = 3

begin
  data = uri.open(redirect: false)
  info = data.read
  ships = JSON.parse(info)
  
  ships["results"].map do |s| 
    # binding.pry
    Product.create(
        name: s["name"], 
        model: s["model"],
        manufacturer: s["manufacturer"],
        cost_in_credits: s["cost_in_credits"],
        length: s["length"],
        max_atmosphering_speed: s["max_atmosphering_speed"],
        crew: s["crew"],
        passengers: s["passengers"]
        )
  end

rescue OpenURI::HTTPRedirect => redirect
  uri = redirect.uri # assigned from the "Location" response header
  retry if (tries -= 1) > 0
  raise
end



# def list_recipes
#     data = open("http://www.recipepuppy.com/api/").read
#     result = JSON.parse(data)
#     result["results"]
#   end

#   def import
#     list_recipes.collect {|x| Recipe.new_from_hash(x)}
#   end
