class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?
    helper_method :current_teacher
    helper_method :teacher_logged_in? 
    # before_action :require_login

    def logged_in?
        current_user
    end    

    def require_login
        if !logged_in?
            redirect_to root_path
        end
    end

    def current_user
        @current_user ||= Student.find_by(id: session[:user_id])
    end

    def require_teacher_login
        if session[:teacher] == false
            redirect_to root_path
        end
    end

    def teacher_logged_in?
        current_teacher
    end

    def current_teacher #THIS IS CAUSING AN ISSUE
        @current_teacher ||= Teacher.find_by(id: session[:user_id])
        # if session[:teacher] == false
        #     redirect_to root_path
        # else
        #     @current_teacher ||= Teacher.find_by(id: session[:user_id])
        # end
    end

end
