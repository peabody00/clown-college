class SchedulesController < ApplicationController
    before_action :require_login
    def index
        if params[:student_id]
            @student = find_student
            @schedules = @student.schedules
        else
            @schedules = Schedule.all
        end
    end
    
    def new
        @student = find_student
        @schedule = @student.schedules.build
    end
    
    def show
    end
    
    def create        
        @student = find_student
        @schedule = @student.schedules.build(schedule_params)
        @courses = Course.all
        if @schedule.save
            redirect_to student_schedules_path(@student.id)
        else  
            render :new
        end 
    end

    def edit
        @student = find_student
        @schedule = find_schedule
    end

    def update
        @student = find_student
        @schedule = find_schedule
        if @schedule.update(schedule_params)
            redirect_to student_schedules_path(@student.id)
        else
            render :edit
        end
    end

    def destroy
        @student = find_student
        @schedule = find_schedule
        @schedule.destroy
        redirect_to student_schedules_path(@student.id)
    end

    private

    def schedule_params
        params.require(:schedule).permit(:student_id, :course_id, :semester)
    end
end
