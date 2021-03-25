class Style < ApplicationRecord
  has_many :boxes, dependent: :destroy
end
