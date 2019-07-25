class ProductsController < ApplicationController
  def top
    @products = Product.all
  end
end
