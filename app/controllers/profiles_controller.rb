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
      redirect_to @profile, notice: "登録しました"
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
      redirect_to @profile, notice: "編集しました"
    else
      render 'edit'
    end
  end

  def destroy
    current_user.profile.destory
  end

  private
    def profile_params
      params.require(:profile).permit(:picture, :name, :content)
    end
end
