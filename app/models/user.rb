class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: true }
  validates :password, presence: true, format: { with: /\A[a-z0-9]+\z/i }
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_reading, presence: true, format: {
    with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/
  }
  validates :first_name_reading, presence: true, format: {
    with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/
  }
  validates :birth_date, presence: true

  has_many :items
  has_many :orders
end
