class LikesController < ApplicationController
  before_action :ransack_set
  before_action :authenticate_user!
  before_action :current_user_set, only:[:index]
  before_action :set_product, only:[:create, :destroy]

  def index
    @products = @user.productlikes.page(params[:page]).per(30)
  end

  def create
    like = current_user.likes.build(product: @product)
    if like.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    like = Like.find_by(user_id: params[:id], product_id: @product)
    if like.destroy
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

    def set_product
      @product = Product.find(params[:product_id])
    end
end
