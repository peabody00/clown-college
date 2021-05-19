class ActivitiesController < ApplicationController
    before_action :require_teacher_login, except:[:index, :show]
    def index
        if params[:teacher_id]
            @teacher = find_teacher
            @activities = @teacher.activities
        else
            @activities = Activity.all
        end
    end

    def new
        @teacher = find_teacher
        @activity = @teacher.activities.build
    end

    def show
    end

    def create
        @teacher = find_teacher
        @activity = @teacher.activities.build(activity_params)
        if @activity.save
            redirect_to teacher_activities_path(@teacher.id)
        else  
            render :new
        end 

    end

    def edit
        @teacher = find_teacher
        @activity = find_activity
    end

    def update
        @teacher = find_teacher
        @activity = find_activity
        if @activity.update(activity_params)
            redirect_to teacher_activities_path(@teacher.id)
        else  
            render :edit
        end 
    end

    def destroy
        @activity = find_activity
        @activity.destroy
        redirect_to teacher_activities_path(current_teacher.id)
    end

    private

    def activity_params 
        params.require(:activity).permit(:name, :description, :teacher_id)
    end
end
