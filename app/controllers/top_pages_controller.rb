class TopPagesController < ApplicationController
    before_action :ransack_set
    
    def index
        @products = Product.last(8)
    end
end
