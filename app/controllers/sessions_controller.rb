class SessionsController < ApplicationController
  def new
  end
  
  def create
      user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:info] = '新規ユーザーを作成しました。'
      log_in user
      redirect_to user
    else
      render :new
    end
  end
  
  def destroy
    log_out if logged_in?
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
  
end
