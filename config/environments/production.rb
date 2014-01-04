require 'i18n/missing_translations'

Food::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.

  # Raise an error on page load if there are pending migrations

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  config.reload_classes_only_on_change = false

  config.app_middleware.use(I18n::MissingTranslations, 'log/missing_translations.yml') if Rails.env.development?



  #
  #ActiveSupport::Dependencies.autoload_paths << File::join( Rails.root, 'lib')
  #ActiveSupport::Dependencies.explicitly_unloadable_constants << 'food_data'

end
