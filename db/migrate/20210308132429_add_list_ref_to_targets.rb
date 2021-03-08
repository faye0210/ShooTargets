class AddListRefToTargets < ActiveRecord::Migration[5.2]
  def change
    add_reference :targets, :list, foreign_key: true
  end
end
