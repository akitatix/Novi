class Skill < ApplicationRecord
  searchkick word_middle: [:name]
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  has_one_attached :photo
  has_many :skill_orders, :dependent => :destroy
  has_many :users, through: :skill_orders
  has_many :reviews, :dependent => :destroy
end
