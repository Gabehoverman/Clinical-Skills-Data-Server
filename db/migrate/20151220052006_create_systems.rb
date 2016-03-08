class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|

      t.string :name
      t.text :details

    end
  end
end