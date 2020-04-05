class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.references :team_a, null: false, foreign_key: { to_table: :teams }, index: true
      t.references :team_b, null: false, foreign_key: { to_table: :teams }, index: true
      t.datetime :game_started_at

      t.timestamps
    end
  end
end
