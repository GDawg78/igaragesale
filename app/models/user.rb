class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable

  has_one :profile, validate: true
  has_many :sales, class_name: 'Transaction', foreign_key: :seller_id
  has_many :purchases, class_name: 'Transaction', foreign_key: :buyer_id
end
