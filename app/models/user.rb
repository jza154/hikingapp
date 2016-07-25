class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts
  has_many :dogs, dependent: :destroy
  has_many :reviews, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "paw.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
  def self.search(search)
      where("name LIKE ?", "%#{search}%") 
  end
end
