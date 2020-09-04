class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    # before_action :authenticate_user!

    def authenticate_user_talent
        unless user_signed_in?
            unless talent_signed_in?
                redirect_to root_path
            end
        end
    end

    def after_sign_in_path_for(resource)
        case resource
        when Talent
            talents_talent_path(current_talent)
        else
            root_path
        end
    end

    def after_sign_out_path_for(resource)
        root_path
    end


    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
