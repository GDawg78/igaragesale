class Item < ApplicationRecord
     has_one_attached :item_picture
     validates :title, presence: true
     belongs_to :profile
     has_many :transactions
     validates :title, presence: true
     validates :description, presence: true
     validates :price, presence: true 
end
