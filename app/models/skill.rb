class Skill < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  has_many :skill_orders, :dependent => :destroy
  has_many :users, through: :skill_orders
end
