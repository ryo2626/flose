require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Flose
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.i18n.default_locale = :ja
    config.action_controller.include_all_helpers = false
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

Refile.secret_key = '9a0da40ef0a0631e11c7fde73e5af18770881bba9a4948295546d066628b6809ddaa57b624a19dfa5663edef82e02e35acb167631a2be0f81be2a4418910de6e'
