class TopPagesController < ApplicationController
  before_action :ransack_set

  def index
    @products = Product.order(id: :desc).first(8)
  end
end
