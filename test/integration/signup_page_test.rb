require 'test_helper'

class SignupPageTest < ActionDispatch::IntegrationTest

	def setup
		@user1 = users(:user1)
	end
  
	test "logged in user is redirected trying to access signup page" do
		get root_path
		assert_not logged_in_test?
		log_in_test @user1
		assert logged_in_test?
		logout_test
		assert_not logged_in_test?
		log_in_test @user1
		assert logged_in_test?
		get signup_path
		assert_redirected_to root_path
	end

end
