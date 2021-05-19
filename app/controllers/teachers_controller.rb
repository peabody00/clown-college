class TeachersController < ApplicationController
    before_action :require_teacher_login, except:[:index, :new, :create]

    def index
        @teachers = Teacher.teacher_courses
    end
    
    def new
        if !teacher_logged_in?
            @teacher = Teacher.new
        else
            redirect_to root_path
        end
    end

    def show
        @teacher = find_teacher
    end

    def edit
        @teacher = find_teacher
    end
    
    def update
        @teacher = find_teacher
        @teacher.update(teacher_params)
        redirect_to teacher_path(@teacher)
    end

    def create
        @teacher = Teacher.new(teacher_params)

        if @teacher.save && @teacher.access_code == "123456789"
            session[:user_id] = @teacher.id
            session[:teacher] = true
            teacher_logged_in?
            redirect_to teacher_path(@teacher)
        else  
            render :new
        end 
    end 
    
    private
    
    def teacher_params 
        params.require(:teacher).permit(:first_name, :last_name, :username, :password, :password_confirmation, :access_code, :department)
    end 
end
