class CreatePays < ActiveRecord::Migration[5.2]
  def change
    create_table :pays do |t|
      t.string :start_time：datetime
      t.integer :price,     null: false
      t.string :memo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
