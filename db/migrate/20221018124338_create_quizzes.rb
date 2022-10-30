class CreateQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :quizzes do |t|

      t.timestamps
      t.integer :exam_and_quiz_id, null: false
      t.integer :item_id, null: false
      t.text :question, null: false
      t.string :correct_answer, null: false

    end
  end
end
