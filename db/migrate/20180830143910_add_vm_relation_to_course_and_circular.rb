class AddVmRelationToCourseAndCircular < ActiveRecord::Migration[5.2]
  def change
    create_table :vertical_market_courses do |t|
      t.references :vertical_market, null: false
      t.references :course, null: false

      t.timestamps null: false
    end

    create_table :vertical_market_circulars do |t|
      t.references :vertical_market, null: false
      t.references :circular, null: false

      t.timestamps null: false
    end
  end
end
