class Notification < ActiveRecord::Base
	validates :event_id, presence: true
	validates :user_id, presence: true
	validate :notification_type_is_limited

	private

		def notification_type_is_limited
			allowed_types = [ "event_invitation", "request_invitation_accepted", "request_invitation_declined", "user_following_you" ]
			unless allowed_types.include?(self.type)
				errors.add(:notification_type, "Invalid notification type")
			end
		end

end
