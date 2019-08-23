class PurchasesController < ApplicationController
  before_action :ransack_set
  before_action :authenticate_user!

  def index
    @products = current_user.productpurchases.page(params[:page])
  end

  def update
    @product = Product.find(params[:id])
    return redirect_to @product if @product.inprocess? && @product.sold! 
    unless @product.purchase? && @product.inprocess!
      flash[:notice] = t('.alert')
      return render :show 
    end
    purchase = current_user.purchases.build(product: @product)
    if purchase.save
      redirect_to @product, notice: t('.success')
    else
      render :show 
    end
  end

  private
    def purchase_params
      params.require(:purchase).permit(:product_id)
    end
end

