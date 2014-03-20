class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # prepend_before_action :require_no_authentication, :only => [:after_sign_in_path_for]
  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  protected

  def referral_code_exists?(code)
    ReferralCode.find_by code: code
  end

  def valid_referral_code?(code, current_event)
    code = referral_code_exists?(code)
    return false if code == nil

    if code.codeable_type == "Event"
      if code.codeable == current_event 
        return true
      else
        return false
      end
    end

    if code.codeable_type == "User"
      if code.codeable.events.include?(current_event) 
        return true
      else
        return false
      end
    end

  end

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

  private

  def get_event_from_params
    @event = Event.find_by id: params[:event_id]
  end

  def find_user
    @user = User.where(:subdomain => request.subdomain).first
  end

end
