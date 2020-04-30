class CreatePlanCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :plan_courses do |t|
      t.references :plan, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.string :term
      t.integer :year

      t.timestamps
    end
  end
end
