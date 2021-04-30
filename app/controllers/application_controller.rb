class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in? 
    before_action :require_login

    def logged_in?
        current_user
    end    

    def require_login
        if !logged_in?
            redirect_to login_path
        end
    end

    def current_user
        @current_user ||= Student.find_by(id: session[:user_id])
    end

end
