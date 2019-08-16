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
      flash[:notice] = "いいね！しました"
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "いいね！できませんでした。再度実行してください。"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    like = Like.find_by(user_id: params[:id], product_id: @product)
    if like.destroy
      flash[:notice] = "いいね！取り消しました"
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "いいね！取り消しできませんでした。再度実行してください。"
      redirect_back(fallback_location: root_path)
    end
  end

  private

    def set_product
      @product = Product.find(params[:product_id])
    end
end
