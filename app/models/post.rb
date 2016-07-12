class Post < ActiveRecord::Base


def self.search(search)
  where("Title LIKE ?", "%#{search}%") 
  where("content LIKE ?", "%#{search}%")
end

    
end
