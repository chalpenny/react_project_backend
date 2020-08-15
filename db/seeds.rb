# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)





require 'open-uri'
require 'json'


Product.delete_all

url = 'https://swapi.dev/api/starships'

uri = URI.parse(url)
tries = 3

begin
  data = uri.open(redirect: false)
  ships = JSON.parse(data.read)
  
  ships["results"].map do |s| 
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
