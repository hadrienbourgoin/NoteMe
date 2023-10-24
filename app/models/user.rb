class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups, dependent: :destroy

  error_mssg = "Username can't have blank space and may only contains alphabetical and/or numerical characters"
  validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/, message: error_mssg }
end
