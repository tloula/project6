class CreateCourseCatalogs < ActiveRecord::Migration[6.0]
  def change
    create_table :course_catalogs do |t|
      t.references :course, null: false, foreign_key: true
      t.references :catalog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
