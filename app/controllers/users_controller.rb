class UsersController < ApplicationController

	before_action :redirect_not_logged_in_user, only: [ :edit, :update, :destroy ]
	before_action :redirect_logged_in_user, only: [ :new, :create ]
	before_action only: [:edit, :update, :edit_password, :update_password, :destroy] do
		ensure_current_user(User.find(params[:id]))
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Congrats! Welcome to Saurabh Sikchi's event manager"
			log_in @user
			redirect_logged_in_user
		else
			flash.now[:error] = "Invalid signup information"
			render new_user_path
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])	
		if @user.update_attributes(name: params[:user][:name], email: params[:user][:email])
			flash[:success] = "Edit successful"
			redirect_to @user
		else
			flash[:error] = "Edit unsuccessful"
			render 'edit', id: current_user.id
		end
	end

	def edit_password
		@user = User.find(params[:id])
	end

	def update_password
		@user = User.find(params[:id])
		if @user.update_attributes(password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
			flash[:success] = "Password updated"
			redirect_to @user
		else
			flash[:error] = "Password invalid"
			render 'edit_password', id: current_user.id
		end
	end

	def destroy
		User.destroy(current_user.id)
		logout
		redirect_not_logged_in_user
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

end
