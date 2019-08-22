class UserProductsController < ApplicationController
  before_action :ransack_set
  before_action :authenticate_user!

  def index
    @products = current_user.products.purchase.page(params[:page])
  end
end
