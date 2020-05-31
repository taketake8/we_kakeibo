class CreatePayCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :pay_categories do |t|
      t.string :name,  null:false
      t.string :color
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
