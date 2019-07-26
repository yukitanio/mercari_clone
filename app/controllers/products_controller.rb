class ProductsController < ApplicationController
  before_action :ransack_set
  
  def top
    @products = Product.take(8)
  end

  def index
    @products = @q.result(distinct: true)
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
      flash[:notice] = "出品しました"
      redirect_to @product
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
      flash[:notice] = "編集しました"
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

  def category_list
    @q = Product.ransack(params[:q])
    @product = Product.new
  end

  def transaction_status
    @product = Product.find(params[:id])
    if @product.transaction_status_before_type_cast == 0
      @product.update_attribute(:transaction_status, 1)
      flash[:notice] = "ありがとうございました。商品発送までしばらくお待ちください"
      redirect_to @product
    else
      @product.update_attribute(:transaction_status, 2)
      redirect_to @product
    end
  end

  private
    def product_params
      params.require(:product).permit(:picture, :name, :price, :categories, :status, :content)
    end

    def ransack_set
      @q = Product.ransack(params[:q])
    end
end