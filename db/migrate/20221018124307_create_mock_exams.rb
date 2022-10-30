class CreateMockExams < ActiveRecord::Migration[6.1]
  def change
    create_table :mock_exams do |t|

      t.timestamps
      t.integer :exam_and_quiz_id, null: false
      t.integer :point, null: false
      t.string :answer, null: false
      t.boolean :scoring, null: false, default: false

    end
  end
end
