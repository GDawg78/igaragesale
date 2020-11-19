class Profile < ApplicationRecord

    belongs_to :user
    has_one_attached :profile_picture
    has_many :item
    has_one :state
    validates :user_id, uniqueness: true
    validates :username, presence: true, uniqueness: true, :confirmation => true
    validates :first_name, presence: true
    validates :surname, presence: true
    validates :street_no, presence: true, numericality: { only_integer: true }
    validates :street_name, presence: true
    validates :post_code, presence: true, numericality: { only_integer: true }

end
