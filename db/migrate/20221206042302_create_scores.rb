class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|
      t.integer :category_id, null: false, foreign_key: true
      t.integer :user_id,     null: false, foreign_key: true
      t.string :name,         null: false
      t.text :date,           null: false
      t.string :artist,       null: false

      t.timestamps
    end
  end
end
