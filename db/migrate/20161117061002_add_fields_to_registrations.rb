class AddFieldsToRegistrations < ActiveRecord::Migration[5.0]
  def change
    add_column :registrations, :position, :string
    add_column :registrations, :experience, :string
    add_column :registrations, :how_heard, :string
    add_column :registrations, :company, :string
    add_column :registrations, :join_email_list, :string
  end
end
