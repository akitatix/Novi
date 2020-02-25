class Review < ApplicationRecord
  belongs_to :user, through: :skill_orders
  belongs_to :skill, through: :skill_orders
end
