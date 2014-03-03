class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # prepend_before_action :require_no_authentication, :only => [:after_sign_in_path_for]
  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(resource)
    subdomain_with_https_or_http(DOMAIN_NAME)
  end

  def subdomain(url)
    Domainatrix.parse(url).subdomain
  end

  def host(url)
    Domainatrix.parse(url).host
  end

  def path(url)
    string = Domainatrix.parse(url).path
    string[0] = ""
    string
  end

  def subdomain_with_https_or_http(url, subdomain="", path="")
    if subdomain == ""
      separator = ""
    else
      separator = "."
    end
    if Rails.application.config.force_ssl == true
        "https://#{subdomain}" + separator + url + path
      else
        "http://#{subdomain}" + separator + url + path 
    end
  end

  def env_is_production?
    Rails.env == "production"
  end

  def configure_devise_permitted_parameters
    registration_params = [:name, :email, :password, :subdomain]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end

end
