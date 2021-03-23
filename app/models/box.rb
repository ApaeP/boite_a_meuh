class Box < ApplicationRecord
  validates :size, presence: true
  belongs_to :sound
  belongs_to :style
  enum size: [
    :extra_tiny,
    :tiny,
    :extra_small,
    :small,
    :extra_medium,
    :medium,
    :large,
    :extra_large,
    :huge,
    :extra_huge,
    :monumental,
    :extra_monumental
  ]
end

