class ProductsController < ApplicationController
  before_action :ransack_set
  before_action :find_product, only:[:show, :edit, :update, :destroy,:transaction_status]
  
  def top
    @products = Product.last(8)
  end

  def index
    @products = @q.result(distinct: true).page(params[:page])
  end

  def show
  end

  def new
    @product = Product.new
    @category = @product.product_categories.build
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
  end

  def update
    if @product.update_attributes(product_params)
      flash[:notice] = "編集しました"
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  def category_list
    @q = Product.ransack(params[:q])
    @product = Product.new
  end

  def transaction_status
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
      params.require(:product).permit(:picture, :name, :price, :status, :content, category_ids: [])
    end

    def ransack_set
      @q = Product.ransack(params[:q])
    end

    def find_product
      @product = Product.find(params[:id])
    end
end