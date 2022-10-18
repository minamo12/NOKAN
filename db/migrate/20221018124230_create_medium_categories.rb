class CreateMediumCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :medium_categories do |t|

      t.timestamps
      t.integer :large_category_id, null: false
      t.string :name, null: false

    end
  end
end
