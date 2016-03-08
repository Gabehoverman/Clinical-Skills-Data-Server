class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|

      t.references :system

      t.string :name
      t.text :inspection
      t.text :notes

    end
  end
end
