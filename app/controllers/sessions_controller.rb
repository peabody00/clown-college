class SessionsController < ApplicationController
  # skip_before_action :require_login, except:[:destroy]

  def new
    if logged_in?
      redirect_to student_path(session[:user_id])
    end
  end
  
  def show
    if teacher_logged_in?
      redirect_to teacher_path(session[:user_id])
    end
  end
  
  def teacher_new # paths are weird with teachers.  App wants to go to sessions#show for teachers.
    if teacher_logged_in?
      redirect_to teacher_path(session[:user_id])
    end
  end

  def teacher_create
    teacher = Teacher.find_by(username: params[:username])
    if teacher && teacher.authenticate(params[:password])
      session[:user_id] = teacher.id
      session[:teacher] = true
      teacher_logged_in?
      redirect_to teacher_path(teacher)
    else
      flash.now[:error] = "Please Check Your Username and/or Password" 
      render :show
    end

  end

  def create
    student = Student.find_by(username: params[:username])
    if student && student.authenticate(params[:password])
      session[:user_id] = student.id
      session[:teacher] = false
      logged_in?
      redirect_to student_path(student)
    else
      flash.now[:error] = "Please Check Your Username and/or Password" 
      render :new
    end

  end

  def destroy
    session.destroy
    redirect_to root_path
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
      logged_in?
      redirect_to student_path(student)
    else
      redirect_to login_path 
    end 
  end 
end