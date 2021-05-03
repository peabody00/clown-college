class CoursesController < ApplicationController
        
    def index
        @courses = Course.all
    end

    def new
        if !teacher_logged_in?
            @course = Course.new
        else
            redirect_to root_path
        end
    end

    def show
    end

    def create
        if !teacher_logged_in?
            @course = Course.new(course_params)
        else
            redirect_to root_path
        end
    end

    def update
    end

    def destroy
    end

    private

    def course_params 
        params.require(:course).permit(:name, :description)
    end 
    
end
