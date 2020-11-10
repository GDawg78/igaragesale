class Profile < ApplicationRecord

    belongs_to :user
    has_one_attached :profile_picture
    validates :user_id, uniqueness: true
    has_many :item

end
