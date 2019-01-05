require 'rails/generators'

module Robokassa
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def create_initializer_file
      template 'robokassa.rb',
               File.join('config', 'initializers', 'robokassa.rb')
      template 'payments_helper.rb',
               File.join('app', 'helpers', 'payments_helper.rb')
    end
  end
end