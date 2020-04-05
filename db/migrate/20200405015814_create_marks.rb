class CreateMarks < ActiveRecord::Migration[6.0]
  def change
    create_table :marks do |t|
      t.string :title

      t.timestamps
    end
  end
end
