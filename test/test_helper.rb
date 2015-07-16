ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"

Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def logged_in_test?
  	not session[:user_id].nil?
  end

  def log_in_test(user)
		session[:user_id] = user.id
	end

	def logout_test
		session[:user_id] = nil
	end

end
