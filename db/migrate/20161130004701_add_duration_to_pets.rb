class AddDurationToPets < ActiveRecord::Migration
  def change
    add_column :pets, :duration, :float
  end
end
