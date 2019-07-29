class CategoriesController < ApplicationController
  before_action :ransack_set

  def index
    @categories = Category.all
  end
end
