class ProductsController < ApplicationController
  before_action :ransack_set, only:[:index, :show]
  before_action :find_product, only:[:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destory]

  def index
    @products = @q.result(distinct: true).page(params[:page])
  end

  def show
    @user = User.find(@product.user_id)
  end

  def new
    @product = Product.new
    @category = @product.product_categories.build
  end

  def create
    user = current_user
    @product = user.products.build(product_params)
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
    user = current_user
    @product = user.products.find(params[:id])
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

  private
    def product_params
      params.require(:product).permit(:picture, :name, :price, :status, :content, category_ids: [])
    end

    def find_product
      @product = Product.find(params[:id])
    end
end