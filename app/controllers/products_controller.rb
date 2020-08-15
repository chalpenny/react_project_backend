class ProductsController < ApplicationController

    def index
        products = Product.all
        render json: products
    end
    
    def show
        product = Product.find_by_id(id: params[:id])
        render json: product
    end
    
end
