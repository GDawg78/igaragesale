class Transaction < ApplicationRecord
  belongs_to :seller, class_name: :user
  belongs_to :buyer, class_name: :user
  belongs_to :item
end
