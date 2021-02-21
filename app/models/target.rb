class Target < ApplicationRecord
  validates :title, presence: true, length: { in: 1..255 }
  validates :deadline, presence: true
end
