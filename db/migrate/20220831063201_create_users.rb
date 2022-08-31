class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :session_id, unique: true, null: false
      t.string :full_name, null: false
      t.string :contact_number, null: false
      t.decimal :score, default: 0

      t.timestamps
    end
  end
end
