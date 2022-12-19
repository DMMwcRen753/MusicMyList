class CreateMylistScores < ActiveRecord::Migration[6.1]
  def change
    create_table :mylist_scores do |t|
      t.integer :mylist_id, null: false, foreign_key: true
      t.integer :score_id,  null: false, foreign_key: true

      t.timestamps
    end
  end
end
