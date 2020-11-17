class Item < ApplicationRecord
     has_one_attached :item_picture
     validates :title, presence: true
     belongs_to :profile
     has_many :transactions
end
