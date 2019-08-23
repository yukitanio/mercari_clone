class UserProductsInprocessController < ApplicationController
  before_action :ransack_set
  before_action :authenticate_user!

  def index
    @products = current_user.products.inprocess.page(params[:page])
  end
end