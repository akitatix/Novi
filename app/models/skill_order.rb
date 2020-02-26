class SkillOrder < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  belongs_to :review
end
