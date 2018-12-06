class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    return if @user
      flash[:danger] = t("show")
      redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t("home_wellcome")
      redirect_to @user
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit :name, :email, :password,
                                   :pasword_confirmation
    end

end
