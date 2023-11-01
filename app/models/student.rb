class Student < ApplicationRecord
  belongs_to :group
  has_many :notes, dependent: :destroy
  has_many :grades, dependent: :destroy

  validates :firstname, presence: true, allow_blank: false, length: { maximum: 20 }
  validates :lastname, length: { maximum: 20 }
end
