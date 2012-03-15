spec_dir = File.dirname(__FILE__)
lib_dir = File.join(spec_dir, '..', 'lib')

# Configure Rails Environment
ENV["RAILS_ENV"] = "test"
require File.expand_path("../dummy/config/environment.rb", __FILE__)
require "rails/test_help"
Rails.backtrace_cleaner.remove_silencers!
# Load support files

# Require everything in lib
Dir[File.join(lib_dir, "**/*.rb")].each {|f| require f}

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(spec_dir, "spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec
end
