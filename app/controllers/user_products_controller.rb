class UserProductsController < ApplicationController
  before_action :ransack_set
  before_action :authenticate_user!

  def index
    @products = current_user.products.where(transaction_status: "purchase").page(params[:page]).per(30)
  end
end
