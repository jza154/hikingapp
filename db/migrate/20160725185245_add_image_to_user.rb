class AddImageToUser < ActiveRecord::Migration
  def change
    add_column :users, :Image, :string
  end
end
