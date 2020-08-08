class ProductsController < ApplicationController

    def index
        products = Product.all
        binding.pry
        render json: products
    end
    
end
