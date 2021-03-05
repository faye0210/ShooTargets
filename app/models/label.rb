class Label < ApplicationRecord
	has_many :target_labels, dependent: :destroy
	has_many :targets, through: :target_labels
end
