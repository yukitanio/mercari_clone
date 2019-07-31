class ProfilesController < ApplicationController
    before_action :ransack_set
    before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destory]

    def index
        @users = User.page(params[:page]).per(30)
    end

    def show
        @user = current_user
        @profile = @user.profile
    end
    
    def new
        @profile = Profile.new
    end

    def create
        user = current_user
        @profile = user.build_profile(profile_params)
        if @profile.save
        flash[:notice] = "登録しました"
        redirect_to @profile
        else
         render 'new'
        end
    end

    def edit
        @user = current_user
        @profile = @user.profile
    end

    def update
        @user = current_user
        @profile = @user.profile
        if @profile.update_attributes(profile_params)
            flash[:notice] = "編集しました"
            redirect_to @profile
        else
            render 'edit'
        end
    end

    def destroy
        @user = current_user
        @profile = @user.profile
        @profile.destroy
        redirect_to root_path
    end

    private
        def profile_params
            params.require(:profile).permit(:picture, :name, :content)
        end
end
