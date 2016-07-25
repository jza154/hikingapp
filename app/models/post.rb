class Post < ActiveRecord::Base
  belongs_to :user
  
 # def self.search(search)
 #   where("title LIKE ?", "%#{search}%") 
  #  where("content LIKE ?", "%#{search}%")
  #end
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

