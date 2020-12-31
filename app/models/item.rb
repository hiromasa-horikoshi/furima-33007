class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    has_one          :category
    has_one          :status
    has_one          :burden
    has_one          :prefecture
    has_one          :delivery_days
    has_one          :order
    belongs_to       :user
    has_one_attached :image


    with_options presence: true do
      validates :name
      validates :explanation
      validates :price
      validates :user
      validates :category_id,      numericality: { other_than: 1 } 
      validates :status_id,        numericality: { other_than: 1 } 
      validates :burden_id,        numericality: { other_than: 1 } 
      validates :prefecture_id,    numericality: { other_than: 1 } 
      validates :delivery_days_id, numericality: { other_than: 1 } 
    end
  end
end
