class AddTypesToUser < ActiveRecord::Migration
  def change
    add_column :users, :owner, :boolean
    add_column :users, :walker, :boolean
  end
end
