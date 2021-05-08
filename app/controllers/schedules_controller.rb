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
        @schedule = @student.schedules.build
    end
    
    def show
    end
    
    def create        
        @student = Student.find(params[:student_id])
        @schedule = @student.schedules.build(schedule_params)
        @courses = Course.all
         if @schedule.save
            redirect_to student_schedules_path(@student.id)
        else  
            render :new
        end 
    end

    def edit #Not Working
        @student = Student.find(params[:student_id])
        @schedule = @student.schedules.build
    end

    def update
        @student = Student.find(params[:student_id])
        @schedule = @student.schedules.build
        if @schedule.update(schedule_params)
            redirect_to student_schedules_path(@student.id)
        else
            render :edit
        end
    end

    def destroy
        @student = Student.find(params[:student_id])
        @schedule = Schedule.find_by_id(params[:id])
        @schedule.destroy
        redirect_to student_schedules_path(@student.id)
    end

    private

    def schedule_params
        params.require(:schedule).permit(:student_id, :course_id, :semester)
    end
end
