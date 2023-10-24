class Student < ApplicationRecord
  belongs_to :group
  has_many :notes, dependent: :destroy
end
