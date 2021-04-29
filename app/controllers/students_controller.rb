class StudentsController < ApplicationController
    skip_before_action :require_login, only:[:new, :create]
    
    def new
        @student = Student.new
    end

    def show
    end

    def create
        @student = Student.new(student_params)

        if @student.password == @student.password_confirmation
            @student.save
            session[:user_id] = @student.id
            redirect_to student_path(@student)
        else  
            render :new
        end 
    end 
    
    private
    
    def student_params 
        params.require(:student).permit(:first_name, :last_name, :username, :password, :password_confirmation)
     end 
end
