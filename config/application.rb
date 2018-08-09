require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)
Bundler.require(:default, :assets, Rails.env)

module Overtime
  class Application < Rails::Application
    config.load_defaults 5.2
    config.autoload_paths << Rails.root.join('lib')
  end

  # Enable the asset pipeline
  config.assets.enabled = true
  # Version of your assets, change this if you want to expire all your assets
  config.assets.version = '1.0'
end
