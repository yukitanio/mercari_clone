class LikesController < ApplicationController
    before_action :ransack_set
    before_action :authenticate_user!
    before_action :current_user_set, only:[:index]

    def index
        @products = @user.productlikes.page(params[:page]).per(30)
    end

    def create
        current_user.likes.create!(product_id: params[:id])
        redirect_back(fallback_location: root_path)
    end

    def destroy
        @like = Like.find_by(user_id: current_user.id, product_id: params[:id])
        @like.destroy
        redirect_back(fallback_location: root_path)
    end
end
