class ProfilesController < ApplicationController
    before_action :ransack_set
    before_action :authenticate_user!
    before_action :current_user_set, only:[:show, :create, :edit, :update, :destroy]

    def index
        @users = User.page(params[:page]).per(30)
    end

    def show
        @profile = @user.profile
    end
    
    def new
        @profile = Profile.new
    end

    def create
        @profile = @user.build_profile(profile_params)
        if @profile.save
        flash[:notice] = "登録しました"
        redirect_to @profile
        else
         render 'new'
        end
    end

    def edit
        @profile = @user.profile
    end

    def update
        @profile = @user.profile
        if @profile.update_attributes(profile_params)
            flash[:notice] = "編集しました"
            redirect_to @profile
        else
            render 'edit'
        end
    end

    def destroy
        @profile = @user.profile
        @profile.destroy
        redirect_to root_path
    end

    private
        def profile_params
            params.require(:profile).permit(:picture, :name, :content)
        end
end
