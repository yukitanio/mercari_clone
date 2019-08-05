class PurchasesController < ApplicationController
  before_action :ransack_set
  before_action :authenticate_user!
  before_action :current_user_set, only:[:index]

  def index
    @products = @user.productpurchases.page(params[:page]).per(30)
  end

  def update
    @product = Product.find(params[:id])
    if @product.purchase? && @product.inprocess!
      purchase = current_user.purchases.create(product_id: @product.id)
      unless purchase.save
        flash[:notice] = "エラーが発生しました。再度実行してください。"
        render 'show'
      end
      flash[:notice] = "ありがとうございました。商品発送までしばらくお待ちください"
      redirect_to @product
    elsif @product.inprocess? && @product.sold! 
      redirect_to @product
    else
      flash[:notice] = "エラーが発生しました。再度実行してください。"
      render 'show'
    end
  end

  private
    def purchase_params
      params.require(:purchase).permit(:product_id)
    end
end

