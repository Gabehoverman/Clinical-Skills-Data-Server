class CreatePalpations < ActiveRecord::Migration
  def change
    create_table :palpations do |t|

      t.references :component

      t.string :structure
      t.text :details
      t.text :notes

    end
  end
end
