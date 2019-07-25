class ProductsController < ApplicationController
  def top
    @products = Product.take(8)
  end

  def index
    @products = Product.all
  end
end
