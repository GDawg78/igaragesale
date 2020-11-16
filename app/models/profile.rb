class Profile < ApplicationRecord

    belongs_to :user
    has_one_attached :profile_picture
    validates :user_id, uniqueness: true
    #   validates :username, :first_name, :surname, :street_no, :street_name, :post_code
    has_many :item
    has_one :state

end
