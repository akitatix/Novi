class Review < ApplicationRecord
  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5] }
  belongs_to :user
  belongs_to :skill

end
