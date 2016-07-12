class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  def self.search(search)
  where("name LIKE ?", "%#{search}%") 
end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         

end
