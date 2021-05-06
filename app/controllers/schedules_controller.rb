class SchedulesController < ApplicationController
    before_action :require_login
    def index
        if params[:student_id]
            @student = Student.find(params[:student_id])
            @schedules = @student.schedules
        else
            @schedules = Schedule.all
        end
    end

    def new
        @student = Student.find(params[:student_id])
        @schedules = @student.schedules
    end

    def show
    end

    def create
        @student = Student.find(params[:student_id])
        @schedule = @student.schedules.build(schedule_params)
        @courses = Course.all
        if @schedule.save
            redirect_to student_schedule_path(@student.id)
        else  
            render :new
        end 
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def schedule_params
        params.require(:schedule).permit(:student_id, :course_id, :semester)
    end
end
