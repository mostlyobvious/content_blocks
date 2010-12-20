require 'rails/generators'
require 'rails/generators/active_record'

module ContentBlocks
  class SnippetGenerator < Rails::Generators::Base
    include Rails::Generators::Migration
    extend ActiveRecord::Generators::Migration

    def self.source_root
      @source_root ||= File.join(File.dirname(__FILE__), 'templates')
    end

    def copy_migration_template
      migration_template 'migration.rb', 'db/migrate/create_content_blocks_snippets'
    end
  end
end
