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

  def save_items(labels)
    current_labels = self.labels.pluck(:name) unless self.labels.nil?
    old_labels = current_labels - labels
    new_labels = labels - current_labels

    # Destroy
    old_labels.each do |old_name|
      self.labels.delete Label.find_by(name:old_name)
    end

    # Create
    new_labels.each do |new_name|
      item_label = Label.find_or_create_by(name:new_name)
      self.labels << item_label
    end
  end
end
