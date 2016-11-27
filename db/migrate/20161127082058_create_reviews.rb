class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :comment
      t.integer :pet_id

      t.timestamps null: false
    end
  end
end
