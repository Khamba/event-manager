class EventsController < ApplicationController

	before_action(except: :show) do
		redirect_not_logged_in_user(login_path)
	end

	def new
		@event = Event.new
	end

	def create
		params[:event][:made_by_user_id] = current_user.id
		@event = Event.new(event_params)
		if @event.save
			flash[:success] = "Event successfully saved"
			redirect_to @event
		else
			render 'events/new'
		end
	end

	def show
		@event = Event.find(params[:id])
	end

	def menu
		@user = current_user
	end

	private

		def event_params
			params.require(:event).permit(:name, :date, :place, :made_by_user_id)
		end

end
