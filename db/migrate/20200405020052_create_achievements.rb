class CreateAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :achievements do |t|
      t.references :mark, null: false, foreign_key: true, index: true
      t.references :player, null: false, foreign_key: true, index: true
      t.references :game, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
