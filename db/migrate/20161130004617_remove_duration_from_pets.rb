class RemoveDurationFromPets < ActiveRecord::Migration
  def change
    remove_column :pets, :duration, :integer
  end
end
