class CreateMockExams < ActiveRecord::Migration[6.1]
  def change
    create_table :mock_exams do |t|

      t.timestamps
      t.integer :customer_id, null: false
      t.integer :point, null: false

    end
  end
end
