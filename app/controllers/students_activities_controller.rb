class StudentsActivitiesController < ApplicationController
    before_action :require_login
    def index
        if params[:student_id]
            @student = Student.find(params[:student_id])
            @students_activities = @student.student_activities
        else
            @students_activities = StudentActivity.all
        end
    end
    
    def new
        @student = Student.find(params[:student_id])
        # binding.pry
        @student_activity = @student.student_activities.build
    end
    
    def show
    end
    
    def create        
        @student = Student.find(params[:student_id])
        @student_activity = @student.students_activities.build(student_activity_params)
        @students_activities = StudentActivity.all
         if @student_activity.save
            redirect_to student_students_activities_path(@student.id)
        else  
            render :new
        end 
    end

    def edit
        @student = Student.find(params[:student_id])
        @student_activity = StudentActivity.find_by_id(params[:id])
    end

    def update
        @student = Student.find(params[:student_id])
        @student_activity = StudentActivity.find_by_id(params[:id])
        if @student_activity.update(student_activity_params)
            redirect_to student_students_activities_path(@student.id)
        else
            render :edit
        end
    end

    def destroy
        @student = Student.find(params[:student_id])
        @student_activity = StudentActivity.find_by_id(params[:id])
        @student_activity.destroy
        redirect_to student_students_activities_path(@student.id)
    end

    private

    def student_activity_params
        params.require(:student_activity).permit(:student_id, :course_id)
    end
end