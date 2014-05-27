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
  config.self_closing_tags = [:youtube, :img]

  # the type of quotes to use for attribute values, default is double quotes (")
  config.quotes = '"'
end