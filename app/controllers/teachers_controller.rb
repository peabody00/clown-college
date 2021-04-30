class TeachersController < ApplicationController
    skip_before_action :require_login, only:[:new, :create]
    
    def new
        if !logged_in?
            @teacher = Teacher.new
        else
            redirect_to root_path
        end
    end

    def show
    end

    def create
        @teacher = Teacher.new(teacher_params)

        if @teacher.save && @teacher.access_code == "123456789"
            session[:user_id] = @teacher.id
            redirect_to teacher_path(@teacher)
        else  
            render :new
        end 
    end 
    
    private
    
    def teacher_params 
        params.require(:teacher).permit(:first_name, :last_name, :username, :password, :password_confirmation, :access_code)
     end 
end
