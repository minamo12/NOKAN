class CreateSmallCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :small_categories do |t|

      t.timestamps
      t.integer :medium_category_id, null: false
      t.string :name, null: false

    end
  end
end
