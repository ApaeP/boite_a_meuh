class Sound < ApplicationRecord
  has_one_attached :sound_file
  has_many :boxes, dependent: :destroy

  validates :sound_file, attached: true, content_type: ['audio/mpeg', 'audio/ogg', 'audio/aac'], size: { less_than: 1.megabytes , message: 'Should be under 1Mb' }
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
end
