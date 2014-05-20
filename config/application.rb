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

    config.assets.paths << Rails.root.join("vendor", "assets", "javascripts", "beetle")
    config.assets.paths << Rails.root.join("vendor", "assets", "javascripts", "olsonkart")

    config.assets.paths << Rails.root.join("vendor", "assets", "fonts", "beetle")

    config.assets.precompile += %w(beetle/style.css)
    config.assets.precompile += %w(beetle/layers.min.css)

    config.assets.precompile += %w(beetle/plugins.js)
    config.assets.precompile += %w(beetle/beetle.js)

    config.assets.precompile += %w(olsonkart/olsonkart_style.css)

    config.assets.precompile += %w(registration.css)
    config.assets.precompile += %w(home.css)
    config.assets.precompile += %w(orders.css)
    config.assets.precompile += %w(bootstrap.min.css)

    config.assets.precompile += %w(sales_chart.js)
    config.assets.precompile += %w(smart-admin/app.js)



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
