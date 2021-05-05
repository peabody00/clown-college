class SchedulesController < ApplicationController
    before_action :require_login
    def index
        if params[:student_id]
            @schedules = Student.find(params[:student_id]).schedule
        else
            @schedules = Schedule.all
        end
    end

    def show
    end
end
