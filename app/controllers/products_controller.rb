class ProductsController < ApplicationController
  def top
    @products = Product.take(8)
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
    def product_params
      params.require(:product).permit(:picture, :name, :price)
    end
end
