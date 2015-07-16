class Invitation < ActiveRecord::Base
	validates :event_id, presence: true
	validates :user_id, presence: true
	validates :from_event_to_user, presence: true
	validates :declined, presence: true

	belongs_to :user
	belongs_to :event
end
