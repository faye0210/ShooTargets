class CreateTargets < ActiveRecord::Migration[5.2]
  def change
    create_table :targets do |t|
      t.string :title, null: false
      t.text :detail, null: false
      t.boolean :status, default: false, null: false
      t.datetime :deadline, null: false
      t.timestamps
    end
  end
end
