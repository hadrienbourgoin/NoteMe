class Grade < ApplicationRecord
  belongs_to :student

  validates :grade, presence: true, numericality: true, format: { with: /\A\d{1,4}(\.\d{1,2})?\z/ }
end
