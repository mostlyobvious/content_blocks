require 'content_blocks'
require 'rails'

module ContentBlocks
  class Railtie < Rails::Railtie
    initializer 'append models path' do
      models_path = File.join(File.dirname(__FILE__), 'models')
      Rails.application.paths.app.models.push File.expand_path(models_path)
    end
  end
end
