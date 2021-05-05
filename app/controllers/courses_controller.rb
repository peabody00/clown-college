class CoursesController < ApplicationController
    before_action :require_teacher_login, except:[:index, :show]
    def index
        if params[:teacher_id]
            @teacher = Teacher.find_by(params[:teacher_id])
            @courses = @teacher.courses
        else
            @courses = Course.all
        end
    end

    def new
        @teacher = Teacher.find_by(params[:teacher_id])
        @course = @teacher.courses.build

        # if params[:teacher_id]
        #     @teacher = Teacher.find_by(params[:teacher_id])
        #     @course = @teacher.courses.build
        # else    
        #     @course = Course.new
        # end
    end

    def show
    end

    def create
        @teacher = Teacher.find_by(params[:teacher_id])
        @course = @teacher.courses.build(course_params)
        if @course.save
            redirect_to teacher_courses_path(@teacher.id)
        else  
            render :new
        end 

    end

    def edit
        @course = Course.find_by_id(params[:id])
    end

    def update
        @course = Course.find_by_id(params[:id])
        redirect_to teacher_courses_path(@course.teacher_id)
    end

    def destroy
        @course = Course.find_by_id(params[:id])
        @course.destroy
    end

    private

    def course_params 
        params.require(:course).permit(:name, :description, :teacher_id)
    end 
    
end
