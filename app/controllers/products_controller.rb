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

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path
  end

  def transaction_status
    @product = Product.find(params[:id])
    if @product.transaction_status_before_type_cast == 0
      @product.update_attribute(:transaction_status, 1)
      redirect_to @product
    else
      @product.update_attribute(:transaction_status, 2)
      redirect_to @product
    end
  end

  private
    def product_params
      params.require(:product).permit(:picture, :name, :price)
    end
end
