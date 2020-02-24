class Skill < ApplicationRecord
  has_many :skill_orders
  has_many :users, through: :skill_orders
end
