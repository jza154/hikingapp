# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  event_name :string
#  desription :text
#  date       :date
#  location   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  latitude   :float
#  longitude  :float
#  time       :time
#  user_id    :integer
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
