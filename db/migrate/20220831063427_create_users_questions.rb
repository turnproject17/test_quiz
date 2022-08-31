class CreateUsersQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :users_questions do |t|
      t.integer :user_id, null: false, index: true
      t.integer :question_id, null: false
      t.integer :answer_id, null: false
      t.decimal :result, default: 0

      t.timestamps
    end
  end
end
