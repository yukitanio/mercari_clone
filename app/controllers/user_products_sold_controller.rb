class UserProductsSoldController < ApplicationController
  before_action :ransack_set
  before_action :authenticate_user!

  def index
    @products = current_user.products.sold.page(params[:page])
  end
end
