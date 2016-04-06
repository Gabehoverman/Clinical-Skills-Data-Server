class CreateExamTechniques < ActiveRecord::Migration
  def change
    create_table :exam_techniques do |t|

      t.references :system

      t.string :name
      t.string :details

    end
  end
end
