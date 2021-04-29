class SessionsController < ApplicationController
    def new
    end 
  
    def create
      student = Student.find_by(username: params[:username])  
      student = Student.try(:authenticate, params[:password])  
      return redirect_to(controller: 'sessions', action: 'new') unless student
      session[:student_id] = student.id  
      @student = student  
      redirect_to controller: 'welcome', action: 'index'
    end
    
    def destroy 
      session.destroy
    end
end