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

class Dog < ActiveRecord::Base
    belongs_to :user
    # Need to Change Image Size and Defult Image for Dogs
    has_attached_file :dog_image, styles: { medium: "400x320#", thumb: "200x160#" }, default_url: ":style/paw.png" #default_url: "paw.png" 
    validates_attachment_content_type :dog_image, content_type: /\Aimage\/.*\Z/
    
    validates :age, :weight, numericality: { greater_than_or_equal_to: 0 }
    validates :age, numericality: { less_than_or_equal_to: 30,  only_integer: true }
end
