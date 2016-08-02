# == Schema Information
#
# Table name: reviews
#
#  id          :integer          not null, primary key
#  rating      :integer
#  comment     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  reviewer_id :integer
#  receiver_id :integer
#

class Review < ActiveRecord::Base
    belongs_to :user
    
    validates :rating, numericality: { less_than_or_equal_to: 5,  only_integer: true }
end
