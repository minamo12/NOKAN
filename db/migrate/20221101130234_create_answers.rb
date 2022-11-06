class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|

      t.timestamps
      t.integer :mock_exam_id, null: false
      t.integer :quiz_id, null: false
      t.string :answer, null: false
      t.boolean :scoring, null: false, default: false
    end
  end
end
