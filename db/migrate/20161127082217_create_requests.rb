class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.string :request_message
      t.boolean :status
      t.integer :pet_id

      t.timestamps null: false
    end
  end
end
