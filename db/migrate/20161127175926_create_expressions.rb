class CreateExpressions < ActiveRecord::Migration[5.0]
  def change
    create_table :expressions do |t|
      t.string :title
      t.string :english_sntnc
      t.string :polish_sntnc
      t.references :lesson, foreign_key: true
      t.string :audio_en
      t.string :audio_pl
      t.string :image
      t.boolean :premium

      t.timestamps
    end
  end
end
