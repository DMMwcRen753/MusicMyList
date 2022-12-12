class CreateMylists < ActiveRecord::Migration[6.1]
  def change
    create_table :mylists do |t|
      
      t.integer :user_id, null: false, foreign_key: true
      t.string :name,     null: false

      t.timestamps
    end
  end
end
