class UserProductsInprocessController < ApplicationController
  before_action :ransack_set
  before_action :authenticate_user!

  def index
      @user = current_user
      @products = @user.products.where(transaction_status: "inprocess").page(params[:page]).per(30)
  end
end
