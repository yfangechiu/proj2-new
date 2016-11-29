class AddStartDateToPets < ActiveRecord::Migration
  def change
    add_column :pets, :start_date, :date
  end
end
