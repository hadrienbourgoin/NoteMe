class Group < ApplicationRecord
  has_many :students, dependent: :destroy
  belongs_to :user

  validates :name, presence: true, allow_blank: false
end
