class Student < ApplicationRecord
  belongs_to :group
  has_many :notes, dependent: :destroy

  validates :firstname, presence: true, allow_blank: false, length: { maximum: 20 }
  validates :lastname, presence: true, allow_blank: false, length: { maximum: 20 }
end
