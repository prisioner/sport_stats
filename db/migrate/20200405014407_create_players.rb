class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :full_name
      t.references :team, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
