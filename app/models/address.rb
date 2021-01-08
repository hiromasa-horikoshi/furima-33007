class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to             :order,     dependent: :destroy
    belongs_to_active_hash :prefecture
  end
