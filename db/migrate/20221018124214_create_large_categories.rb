class CreateLargeCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :large_categories do |t|

      t.timestamps
      t.string :name, null: false

    end
  end
end
