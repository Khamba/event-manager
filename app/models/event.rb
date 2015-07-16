class Event < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 2 }
	validates :place, presence: true, length: { minimum: 2 }
	validates :made_by_user_id, presence: { message: "cannot be blank" }
	validates :date, date: { after: Proc.new { Date.yesterday }, before: Proc.new { Date.today + 15.years } }

	belongs_to :created_by_user, class_name: "User", foreign_key: :made_by_user_id
	has_and_belongs_to_many :attending_users, class_name: "User", foreign_key: :user_id, :join_table => :events_users
	has_many :invited_users, class_name: "Invitation", foreign_key: :user_id

	end
