class CoursesController < ApplicationController
    before_action :require_teacher_login, except:[:index, :show]
    def index
        if params[:teacher_id]
            @teacher = Teacher.find(params[:teacher_id])
            @courses = @teacher.courses
        else
            @courses = Course.all
        end
    end

    def new
        @teacher = Teacher.find(params[:teacher_id])
        @course = @teacher.courses.build
    end

    def show
    end

    def create
        @teacher = Teacher.find(params[:teacher_id])
        @course = @teacher.courses.build(course_params)
        if @course.save
            redirect_to teacher_courses_path(@teacher.id)
        else  
            render :new
        end 

    end

    def edit
        @teacher = Teacher.find(params[:teacher_id])
        @course = Course.find_by_id(params[:id])
    end

    def update
        @teacher = Teacher.find(params[:teacher_id])
        @course = Course.find_by_id(params[:id])
        if @course.update(course_params)
            redirect_to teacher_courses_path(@teacher.id)
        else  
            render :edit
        end 
    end

    def destroy
        @course = Course.find_by_id(params[:id])
        @course.destroy
        redirect_to teacher_courses_path(current_teacher.id)
    end

    private

    def course_params 
        params.require(:course).permit(:name, :description, :teacher_id)
    end 
    
end
