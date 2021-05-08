class StudentsController < ApplicationController
    before_action :require_login, except:[:new, :create]

    def index
    end 
    
    def new
        if !logged_in?
            @student = Student.new
        else
            redirect_to root_path
        end
    end

    def show
        # binding.pry
        @student = Student.find(params[:id])
    end

    def edit
        # @student = Student.find_by(params[:student_id])
        @student = Student.find(params[:id])
    end
    
    def update
        # @student = Student.find_by(params[:student_id])
        @student = Student.find(params[:id])
        @student.update(student_params)
        redirect_to student_path(@student)
    end

    def create
        @student = Student.new(student_params)

        if @student.save
            session[:user_id] = @student.id
            session[:teacher] = false
            logged_in?
            redirect_to student_path(@student)
        else  
            render :new
        end 
    end 
    
    private
    
    def student_params 
        params.require(:student).permit(:first_name, :last_name, :username, :password, :password_confirmation, :major)
     end 
end
