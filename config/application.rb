require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Downhill
  class Application < Rails::Application
    config.autoload_paths += %W(#{config.root}/lib)
    
    config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "beetle")
    config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "olsonkart")
    config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "smart-admin")

    config.assets.paths << Rails.root.join("vendor", "assets", "javascripts", "beetle")
    config.assets.paths << Rails.root.join("vendor", "assets", "javascripts", "olsonkart")
    config.assets.paths << Rails.root.join("vendor", "assets", "javascripts", "smart-admin")

    config.assets.paths << Rails.root.join("vendor", "assets", "fonts", "beetle")
    config.assets.paths << Rails.root.join("vendor", "assets", "fonts", "smart-admin")

    config.assets.precompile += %w(vendor/assets/stylesheets/beetle/*.css)
    config.assets.precompile += %w(vendor/assets/stylesheets/olsonkart/*.css)
    config.assets.precompile += %w(vendor/assets/stylesheets/smart-admin/*.css)


    config.assets.precompile += %w(vendor/assets/javascripts/beetle/*.js)
    config.assets.precompile += %w(vendor/assets/javascripts/olsonkart/*.js)
    config.assets.precompile += %w(vendor/assets/javascripts/smart-admin/*.js)


    config.assets.precompile += %w(vendor/assets/fonts/beetle/*)
    config.assets.precompile += %w(vendor/assets/fonts/smart-admin/*)

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end
