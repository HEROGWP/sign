class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
	sign_in(@user)
        session[:session_token] = @user.session_token
        flash[:success] = "歡迎回來, #{@user.name}!"
        redirect_to @user
    else
        flash.now[:error] = "email和密碼不正確"
        render "new"
    end  	
  end

  def destroy
	sign_out
  	redirect_to root_path
  end
end
