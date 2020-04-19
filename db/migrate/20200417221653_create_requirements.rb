class CreateRequirements < ActiveRecord::Migration[6.0]
  def change
    create_table :requirements do |t|
      t.string :name
      t.references :major, null: false, foreign_key: true
      t.references :catalog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
