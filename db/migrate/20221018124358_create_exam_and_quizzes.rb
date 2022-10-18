class CreateExamAndQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :exam_and_quizzes do |t|

      t.timestamps
      t.integer :item_id, null: false
      t.integer :quiz_id, null: false
    end
  end
end
