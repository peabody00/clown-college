class CoursesController < ApplicationController
    before_action :require_teacher_login, except:[:index, :show]
    def index
        if params[:teacher_id]
            @teacher = find_teacher
            @courses = @teacher.courses
        else
            @courses = Course.all
        end
    end

    def new
        @teacher = find_teacher
        @course = @teacher.courses.build
    end

    def show
    end

    def create
        @teacher = find_teacher
        @course = @teacher.courses.build(course_params)
        if @course.save
            redirect_to teacher_courses_path(@teacher.id)
        else  
            render :new
        end 

    end

    def edit
        @teacher = find_teacher
        @course = find_course
    end

    def update
        @teacher = find_teacher
        @course = find_course
        if @course.update(course_params)
            redirect_to teacher_courses_path(@teacher.id)
        else  
            render :edit
        end 
    end

    def destroy
        @course = find_course
        @course.destroy
        redirect_to teacher_courses_path(current_teacher.id)
    end

    private

    def course_params 
        params.require(:course).permit(:name, :description, :teacher_id)
    end 
    
end
