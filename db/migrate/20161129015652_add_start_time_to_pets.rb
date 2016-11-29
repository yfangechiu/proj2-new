class AddStartTimeToPets < ActiveRecord::Migration
  def change
    add_column :pets, :start_time, :time
  end
end
