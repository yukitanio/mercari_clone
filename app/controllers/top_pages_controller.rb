class TopPagesController < ApplicationController
  before_action :ransack_set

  def index
    @products = Product.order(id: "DESC").first(8)
  end
end
