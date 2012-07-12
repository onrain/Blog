class SessionAdminController < ApplicationController
  def create
    user = AdminLogin.find_by_login(params[:login].to_s)
    if user and user.password.eql? params[:password].to_s
      session[:login_user] = user.id
      redirect_to admins_path
    else
      redirect_to login_path, :alert => "Invalid login or password."
    end
  end

  def destroy
    session[:login_user] = nil
    redirect_to comments_path, :notice=>"Logout admin success."
  end
  
  def new
    unless session[:login_user].nil?
      redirect_to comments_path
    end
  end
end
