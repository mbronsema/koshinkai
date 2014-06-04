Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  config.action_mailer.default_url_options = {:host => "localhost:3000"}
  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  config.action_mailer.perform_deliveries = true

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    #domain:               ENV['GMAIL_SMTP_USER'],
    domain:               'koshinkai.nl',
    user_name:            ENV['GMAIL_SMTP_USER'],
    password:             ENV['GMAIL_SMTP_PASSWORD'],
    authentication:       'plain',
    enable_starttls_auto: true  }
    
    

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

end

 Shortcode.setup do |config|

  # the template parser to use
  config.template_parser = :haml # :erb or :haml supported, :haml is default

   # location of the template files, default is "app/views/shortcode_templates"
  config.template_path = "support/templates/haml"

   # a hash of templates passed as strings, if this is set it overrides the
   # above template_path option. The default is nil

  # a list of block tags to support e.g. [quote]Hello World[/quote]
  config.block_tags = [:quote]

  # a list of self closing tags to support e.g. [youtube id="12345"]
  config.self_closing_tags = [:youtube]

  # the type of quotes to use for attribute values, default is double quotes (")
  config.quotes = '"'
end