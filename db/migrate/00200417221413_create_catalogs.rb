class CreateCatalogs < ActiveRecord::Migration[6.0]
  def change
    create_table :catalogs do |t|
      t.integer :year

      t.timestamps
    end
  end
end
