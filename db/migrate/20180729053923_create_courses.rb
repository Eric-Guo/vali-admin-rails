class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :address
      t.integer :capacity
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
