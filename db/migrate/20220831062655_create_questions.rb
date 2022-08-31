class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :title, null: false, index: true
      t.text :description
      t.integer :correct_answer_id
      t.decimal :attempt_duration, default: 0

      t.timestamps
    end
  end
end
