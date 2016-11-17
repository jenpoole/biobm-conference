class AddLocationToRegistrations < ActiveRecord::Migration[5.0]
  def change
    add_column :registrations, :location, :string
  end
end
