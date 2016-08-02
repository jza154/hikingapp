# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Post < ActiveRecord::Base
  belongs_to :user
  
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
end

