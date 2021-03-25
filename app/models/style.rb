class Style < ApplicationRecord
  has_one_attached :pattern
  has_many :boxes, dependent: :destroy
end
