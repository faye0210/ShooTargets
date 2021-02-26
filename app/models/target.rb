class Target < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { in: 1..50 }
  validates :detail, length: { maximum: 1000 }
  validates :deadline, presence: true
end
