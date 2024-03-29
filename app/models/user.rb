class User < ApplicationRecord
  has_many :reviews, :dependent => :destroy
  has_many :skill_orders
  has_many :skills, through: :skill_orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
