class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable

  ROLE_ADMIN = 'admin'
  ROLE_USER = 'user'
  ROLE_MANANGER = 'mananger'

  enum role: [ROLE_ADMIN, ROLE_USER, ROLE_MANANGER]

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true

  def admin?
    self.role == ROLE_ADMIN
  end

  def user?
    self.role == ROLE_USER
  end

  def mananger?
    self.role == ROLE_MANANGER
  end
end
