class InvitationsController < ApplicationController

	before_action do
		redirect_not_logged_in_user(login_path)
	end

	def create
		user = User.find_by(params[:invitation][:email])
	end

end