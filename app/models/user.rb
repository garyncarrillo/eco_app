class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  enum role: [:admin, :user, :mananger]

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true
end
