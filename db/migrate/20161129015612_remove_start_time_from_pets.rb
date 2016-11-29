class RemoveStartTimeFromPets < ActiveRecord::Migration
  def change
    remove_column :pets, :start_time, :datetime
  end
end
