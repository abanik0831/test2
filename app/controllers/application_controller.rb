class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :email
  end

  def index
   # @pst = Post.find(params[:id])
  end

  def after_sign_in_path_for(resource)
    if (resource.sign_in_count <= 1)
      '/profiles/new'
    end
  end
end
