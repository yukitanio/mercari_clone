class ProductsController < ApplicationController
  before_action :ransack_set
  
  def top
    @products = Product.last(8)
  end

  def index
    @products = @q.result(distinct: true).page(params[:page])
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
    if @product.purchase? && @product.inprocess!
      flash[:notice] = "ありがとうございました。商品発送までしばらくお待ちください"
      redirect_to @product
    elsif @product.inprocess? && @product.sold! 
      redirect_to @product
    else
      render 'show'
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