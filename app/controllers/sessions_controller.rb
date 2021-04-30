class SessionsController < ApplicationController
  skip_before_action :require_login, only:[:new,:create, :omniauth]

  def new
    if logged_in?
      redirect_to root_path
    end
  end

  def create
    student = Student.find_by(username: params[:username])
    if student && student.authenticate(params[:password])
      session[:user_id] = student.id
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end

  def omniauth
    student = Student.find_or_create_by(uid: request.env['omniauth.auth'][:uid], provider: request.env['omniauth.auth'][:provider]) do |u|
      u.username = request.env['omniauth.auth'][:uid]
      u.first_name = request.env['omniauth.auth'][:info][:first_name]
      u.last_name = request.env['omniauth.auth'][:info][:last_name]      
      u.password = SecureRandom.hex(15)
    end 

    if student.valid?
      session[:user_id] = student.id
      redirect_to root_path
    else
      binding.pry
      redirect_to login_path 
    end 
  end 
end