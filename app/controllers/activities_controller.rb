class ActivitiesController < ApplicationController
    before_action :require_teacher_login, except:[:index, :show]
    def index
        if params[:teacher_id]
            @teacher = Teacher.find(params[:teacher_id])
            @activities = @teacher.activities
        else
            @activities = Activity.all
        end
    end

    def new
        @teacher = Teacher.find(params[:teacher_id])
        @activity = @teacher.activities.build
    end

    def show
    end

    def create
        @teacher = Teacher.find(params[:teacher_id])
        @activity = @teacher.activities.build(activity_params)
        if @activity.save
            redirect_to teacher_activities_path(@teacher.id)
        else  
            render :new
        end 

    end

    def edit
        @teacher = Teacher.find(params[:teacher_id])
        @activity = Activity.find_by_id(params[:id])
    end

    def update
        @teacher = Teacher.find(params[:teacher_id])
        @activity = Activity.find_by_id(params[:id])
        if @activity.update(activity_params)
            redirect_to teacher_activities_path(@teacher.id)
        else  
            render :edit
        end 
    end

    def destroy
        @activity = Activity.find_by_id(params[:id])
        @activity.destroy
        redirect_to teacher_activities_path(current_teacher.id)
    end

    private

    def activity_params 
        params.require(:activity).permit(:name, :description, :teacher_id)
    end 
    
end
