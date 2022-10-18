class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      t.timestamps
      t.integer :customer_id, null: false
      t.integer :board_post_id, null: false
      t.text :comment_text, null: false

    end
  end
end
