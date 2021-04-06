class Label < ApplicationRecord
	has_many :target_labels, dependent: :destroy, foreign_key: 'label_id'
	has_many :targets, through: :target_labels
end
