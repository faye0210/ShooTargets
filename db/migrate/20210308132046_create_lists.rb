class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :title
      t.date :deadline
      t.references :user, foreign_key: true
      t.boolean :status
      t.timestamps
    end
  end
end
