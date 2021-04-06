class TargetLabel < ApplicationRecord
  belongs_to :target
  belongs_to :label
  validates :target_id, presence: true
  validates :label_id, presence: true
end
