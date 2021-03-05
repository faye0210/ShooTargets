class Target < ApplicationRecord
  belongs_to :user
  has_many :target_labels, dependent: :destroy
  has_many :labels, through: :target_labels
  validates :title, presence: true, length: { in: 1..50 }
  validates :detail, length: { maximum: 1000 }
  validates :deadline, presence: true
  validate :date_before_start

  def date_before_start
    if deadline.nil? || deadline < DateTime.now
      errors.add(:deadline, "は今日以降のものを選択してください")
    end
  end
end
