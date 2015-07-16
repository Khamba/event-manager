class User < ActiveRecord::Base
	validates :name, presence: true, length: {minimum: 2, maximum: 40}
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates :password, length: { minimum: 5 }, on: :update, allow_blank: true
	validates :email, uniqueness: true

	has_many :created_events, class_name: "Event", foreign_key: :made_by_user_id
	has_and_belongs_to_many :attending_events, class_name: "Event", foreign_key: :event_id, :join_table => :events_users
	has_many :invitations, -> { where(declined: false).where(from_event_to_user: true) }
	has_many :requested_invitations, -> { where("declined = 'f' AND from_event_to_user = 'f'") }, class_name: "Invitation"

	has_secure_password
end
 