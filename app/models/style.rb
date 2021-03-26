class Style < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :pattern
  has_many :boxes, dependent: :destroy
end
