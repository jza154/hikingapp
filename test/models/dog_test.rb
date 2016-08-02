# == Schema Information
#
# Table name: dogs
#
#  id                     :integer          not null, primary key
#  name                   :string
#  breed                  :string
#  age                    :integer
#  gender                 :string
#  weight                 :float
#  about                  :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  user_id                :integer
#  dog_image_file_name    :string
#  dog_image_content_type :string
#  dog_image_file_size    :integer
#  dog_image_updated_at   :datetime
#

require 'test_helper'

class DogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
