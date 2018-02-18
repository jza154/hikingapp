# == Schema Information
#
# Table name: posts
#
#  id                 :integer          not null, primary key
#  title              :string
#  content            :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Post < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
  
 def self.search(search)
    if search
     self.where("Content || Title  LIKE ?", "%#{search}%")
    else
     self.all
    end
 end
  #  if search
      #find(:all, :conditions => ['Title LIKE ?', "%#{search}%"])
      
   # else
    #  find(:all)
    #end
  #end
#   searchable do
#     text :title, :content
#   end


