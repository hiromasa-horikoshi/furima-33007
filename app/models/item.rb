class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :status
    belongs_to_active_hash :burden
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :delivery_day
    has_one                :order
    belongs_to             :user
    has_one_attached       :image


    with_options presence: true do
      validates :name
      validates :explanation
      validates :price,            numericality: { greater_than_or_equal_to: 300, less_than: 10000000 }, format: {with: /\A[0-9]+\z/ }
      validates :user_id
      validates :image
      with_options numericality: { other_than: 1 }  do
        validates :category_id 
        validates :status_id
        validates :burden_id
        validates :prefecture_id
        validates :delivery_day_id
      end
    end
  end
