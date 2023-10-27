class Note < ApplicationRecord
  belongs_to :student

  validates :description, presence: true, allow_blank: false, length: { maximum: 255 }
end
