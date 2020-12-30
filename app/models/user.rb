class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: { case_sensitive: true }
    validates :password, format: { with: /\A[a-zA-Z0-9]+\z/ }
    validates :last_name, format: {with:/\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name, format: {with:/\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name_reading, format: {
               with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/
               }
    validates :first_name_reading, format: {
               with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/
               }
    validates :birth_date
  end

  has_many :items
  has_many :orders
end
