# Be sure to restart your server when you modify this file.

# Downhill::Application.config.session_store :active_record_store

Downhill::Application.config.session_store :cookie_store, :key => '_domain_session', :domain => ".lvh.me"