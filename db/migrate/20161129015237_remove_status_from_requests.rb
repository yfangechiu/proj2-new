class RemoveStatusFromRequests < ActiveRecord::Migration
  def change
    remove_column :requests, :status, :boolean
  end
end
