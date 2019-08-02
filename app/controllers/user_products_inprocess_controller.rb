class UserProductsInprocessController < ApplicationController
  before_action :ransack_set
  before_action :authenticate_user!
  before_action :current_user_set, only:[:index]

  def index
      @products = @user.products.where(transaction_status: "inprocess").page(params[:page]).per(30)
  end
end
