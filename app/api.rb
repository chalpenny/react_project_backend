require "open-uri"
require "json"
require "pry"

class API 

    def list_products
        data = open("https://swapi.dev/api/").read
        result = JSON.parse(data)
        result["results"]
    end

    def import
        list_products.collect {|x| Product.new_from_hash(x)}
    end

end
end