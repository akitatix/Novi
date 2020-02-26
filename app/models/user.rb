class User < ApplicationRecord
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :age, presence: true
  #has_many :reviews, through: :skill_orders
  has_many :skill_orders
  has_many :skills, through: :skill_orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
