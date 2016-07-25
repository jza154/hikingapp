class AddReceiverToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :receiver, index: true, foreign_key: true
  end
end
