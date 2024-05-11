class CreateTutors < ActiveRecord::Migration[7.0]
  def change
    create_table :tutors do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.belongs_toT :course, foreign_key: true, null: false

      t.timestamps
    end
    add_index :tutors, :email, unique: true
  end
end
