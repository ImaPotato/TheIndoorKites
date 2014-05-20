class UsersController < ApplicationController
  def new
      @user = current_user
      @new_user = User.new
  end

  def create
    @new_user = User.new(user_params)

    if params[:commit] == 'Create Manager'
        # set the is manager to true
        @new_user.is_manager = true
    else
        @new_user.is_manager = false
    end
    
    if @new_user.save
      redirect_to root_url, :notice => 'Signed up'
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :is_manager)
  end
end
