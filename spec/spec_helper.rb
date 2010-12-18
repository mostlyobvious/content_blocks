$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'active_record'
require 'rspec'
require 'rspec/rails/adapters'
require 'rspec/rails/extensions'
require 'rspec/rails/fixture_support'
require 'sqlite3'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.use_transactional_fixtures = true
end

ActiveRecord::Base.configurations = {
  'content_blocks_test' => {
    :adapter => 'sqlite3',
    :database => 'content_blocks_test.db',
    :min_messages => 'warning'
  }
}
ActiveRecord::Base.establish_connection 'content_blocks_test'
load File.join(File.dirname(__FILE__), 'schema', 'schema.rb')

require 'content_blocks'
