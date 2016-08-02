# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  birthday               :date
#  address                :text
#  about                  :text
#  image_file_name        :string
#  image_content_type     :string
#  image_file_size        :integer
#  image_updated_at       :datetime
#  latitude               :float
#  longitude              :float
#  owner                  :boolean
#  walker                 :boolean
#

class User < ActiveRecord::Base
  
  geocoded_by:address 
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  after_validation :lat_changed?
 
  private

# This is used to make sure that our address is actually parsed properly and we
# get a valuable lat/long
def lat_changed?
    if (self.address_changed?)
        if !(self.latitude_changed?)
            self.errors.add(:address, "is not valid")
            return false
        end
    end
    return true
end 
  
#   attr_accessible :address, :latitude, :longitude
#   geocoded_by :address
#   after_validation :geocode, :if => :address_changed?
# end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts
  has_many :events
  has_many :dogs, dependent: :destroy
  has_many :reviews #, dependent: :destroy
  has_many :events

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         

  has_attached_file :image, styles: { medium: "150x150>", thumb: "50x50>" }, default_url: ":style/user.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  acts_as_messageable

  def mailboxer_name
   self.name
  end

  def mailboxer_email(object)
   self.email
  end
  
  def self.search(search)
      where("name LIKE ?", "%#{search}%") 
  end
end#
