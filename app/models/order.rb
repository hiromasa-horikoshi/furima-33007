class Order < ApplicationRecord
  attr_accessor :token
  
  belongs_to :user
  belongs_to :item,   dependent: :destroy
  has_one    :address

end
