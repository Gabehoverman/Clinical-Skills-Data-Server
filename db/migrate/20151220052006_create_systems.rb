class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.references :parent
      t.string :name
      t.string :details
      t.boolean :visible

      t.timestamps null: false
    end
  end
end