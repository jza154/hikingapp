class RegistrationsController < Devise::RegistrationsController
    protected
    def update_resource(resource, params)
        resource.update_without_password(params)
    end

    def after_update_path_for(resource)
      user_path(resource)
    end
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:user_update) { |u| u.permit(:first_name, :last_name, :address, :about, :birthday, :dog_breed ,:dog_height, :dog_weight, :dog_weight, :image) }
    end
end
