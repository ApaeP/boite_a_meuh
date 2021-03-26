class Box < ApplicationRecord
  SIZES = [
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
  validates :size, :name, presence: true
  belongs_to :user, optional: true
  belongs_to :sound
  belongs_to :style
  enum size: SIZES
end

