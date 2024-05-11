class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.text :description
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.timestamps
    end
  end
end
