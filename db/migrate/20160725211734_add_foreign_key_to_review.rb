class AddForeignKeyToReview < ActiveRecord::Migration
  def change
    add_foreign_key :reviews, references: :users
    add_foreign_key :reviews, references: :users
  end
end
