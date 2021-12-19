class CreateLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :levels do |t|
      t.string :name
      t.string :gamemode
      t.string :image_url
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
