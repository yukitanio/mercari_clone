class ApplicationController < ActionController::Base

    private
    def ransack_set
        @q = Product.joins(:categories).ransack(params[:q])
    end
end
