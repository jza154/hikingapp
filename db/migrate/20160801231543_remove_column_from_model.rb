class RemoveColumnFromModel < ActiveRecord::Migration
  def change
    remove_column :users, :dog_height
    remove_column :users, :dog_weight
    remove_column :users, :dog_age
    remove_column :users, :dog_breed
  end
end
