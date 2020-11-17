class Profile < ApplicationRecord

    belongs_to :user
    has_one_attached :profile_picture
    validates :user_id, uniqueness: true
    validates :username, presence: true
    has_many :item
    has_one :state

end
