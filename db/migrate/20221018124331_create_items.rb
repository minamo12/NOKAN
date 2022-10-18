class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.timestamps
      t.integer :large_category_id, null: false
      t.integer :medium_category_id, null: false
      t.integer :small_category_id, null: false
      t.string :name, null: false
      t.text :information, null: false
      t.text :commentary, null: false

    end
  end
end
