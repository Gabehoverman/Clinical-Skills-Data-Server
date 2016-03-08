class CreateMuscles < ActiveRecord::Migration
  def change
    create_table :muscles do |t|

      t.references :component

      t.string :name

    end
  end
end
