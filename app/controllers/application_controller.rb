class ApplicationController < ActionController::Base

  private
    def ransack_set
      @q = Product.joins(:categories).ransack(params[:q])
    end

    def current_user_set
      @user = current_user
    end
end
