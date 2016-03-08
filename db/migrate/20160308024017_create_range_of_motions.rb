class CreateRangeOfMotions < ActiveRecord::Migration
  def change
    create_table :range_of_motions do |t|

      t.references :component

      t.string :motion
      t.string :degrees
      t.text :notes

    end
  end
end
