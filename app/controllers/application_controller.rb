class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # prepend_before_action :require_no_authentication, :only => [:after_sign_in_path_for]

  protect_from_forgery with: :exception

  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  before_action :redirect_to_https

  protected

  def redirect_to_https
    logger.info "Request.ssl: #{request.ssl?}"
    redirect_to :protocol => "https://" unless (request.ssl? || request.local?)
  end

  def check_subdomain
    if is_home_page? == false && current_user != nil
      unless current_user.subdomain == request.subdomain
        redirect_to dashboard
      end
    end

    if is_home_page? && current_user
      redirect_to dashboard
    end
  end

  def is_home_page?
    request.subdomain == ""
  end

  def after_sign_in_path_for(resource)
    dashboard
  end

  def dashboard
    dashboard_url(:subdomain => current_user.subdomain)
  end

  def after_sign_out_path_for(resource)
    root_url
  end

  def log_in_from_your_domain
    raise ActionController::RoutingError.new('Log in from your subdomain!')
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