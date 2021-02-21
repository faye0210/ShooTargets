class CreateTargets < ActiveRecord::Migration[5.2]
  def change
    create_table :targets do |t|
      t.string :title
      t.text :detail
      t.integer :status
      t.datetime :deadline
      t.timestamps
    end
  end
end
