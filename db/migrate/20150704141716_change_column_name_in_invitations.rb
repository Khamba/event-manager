class ChangeColumnNameInInvitations < ActiveRecord::Migration
  def change
  	rename_column :invitations, :delined, :declined
  end
end
