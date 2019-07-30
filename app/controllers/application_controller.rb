class ApplicationController < ActionController::Base

    private
    def ransack_set
        @q = Product.ransack(params[:q])
    end
end
