class CreateBoardPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :board_posts do |t|

      t.timestamps
      t.integer :customer_id, null: false
      t.integer :large_category_id, null: false
      t.string :board_title, null: false
      t.text :board_text, null: false

    end
  end
end
