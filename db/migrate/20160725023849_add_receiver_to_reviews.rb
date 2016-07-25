class AddReceiverToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :user, :as => :receiver, index: true, foreign_key: true
  end
end
