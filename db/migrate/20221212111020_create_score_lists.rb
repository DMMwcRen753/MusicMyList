class CreateScoreLists < ActiveRecord::Migration[6.1]
  def change
    create_table :score_lists do |t|
      t.integer :user_id,   null: false, foreign_key: true
      t.integer :score_id,  null: false, foreign_key: true

      t.timestamps
    end
  end
end
