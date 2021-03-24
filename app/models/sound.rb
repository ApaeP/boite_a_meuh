class Sound < ApplicationRecord
  has_one_attached :sound_file
  has_many :boxes
end
