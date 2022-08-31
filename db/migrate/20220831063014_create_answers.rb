class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.string :title, null: false, index: true
      t.integer :question_id, null: false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
