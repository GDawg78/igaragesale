class Item < ApplicationRecord
     has_one_attached :item_picture
     belongs_to :profile
     has_many :transactions
     validates :title, presence: true
     validates :description, presence: true
     validates :price, presence: true, numericality: { only_float: true }
end
