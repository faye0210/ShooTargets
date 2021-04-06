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

  def save_label(sent_labels)
    current_labels = self.labels.pluck(:name) unless self.labels.nil?
    old_labels = current_labels - sent_labels
    new_labels = sent_labels - current_labels

    old_labels.each do |old|
      self.labels.delete Label.find_by(name: old)
    end

    new_labels.each do |new|
      new_target_label = Label.find_or_create_by(name: new)
      self.labels << new_target_label
    end
  end
end
