class CreateTargetLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :target_labels do |t|
      t.references :target, foreign_key: true
      t.references :label, foreign_key: true
      t.timestamps
    end
  end
end
