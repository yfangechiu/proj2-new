class AddPetToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pet, :string
  end
end
