class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.references :parent_system
      t.string :name
      t.string :description
      t.boolean :visible

      t.timestamps null: false
    end
  end
end