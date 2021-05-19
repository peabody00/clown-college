class StudentsActivitiesController < ApplicationController
    before_action :require_login
    def index
        if params[:student_id]
            @student = find_student
            @students_activities = @student.student_activities
        else
            @students_activities = StudentActivity.all
        end
    end
    
    def new
        @student = find_student
        @activity = @student.student_activities.build
    end
    
    def show
    end
    
    def create        
        @student = find_student
        @student_activity = @student.students_activities.build(student_activity_params)
        @students_activities = StudentActivity.all
        if @student_activity.save
            redirect_to student_students_activities_path(@student.id)
        else  
            render :new
        end 
    end

    def edit
        @student = find_student
        @student_activity = find_student_activity
    end

    def update
        @student = find_student
        @student_activity = find_student_activity
        if @student_activity.update(student_activity_params)
            redirect_to student_students_activities_path(@student.id)
        else
            render :edit
        end
    end

    def destroy
        @student = find_student
        @student_activity = find_student_activity
        @student_activity.destroy
        redirect_to student_students_activities_path(@student.id)
    end

    private

    def student_activity_params
        params.require(:student_activity).permit(:student_id, :course_id)
    end
end