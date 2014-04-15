# Be sure to restart your server when you modify this file.

Downhill::Application.config.session_store :active_record_store, :key => '_domain_session', :domain => COOKIE_DOMAIN  

# Downhill::Application.config.session_store :cookie_store, :key => '_domain_session', :domain => COOKIE_DOMAIN