class CreateBasicExamTechniques < ActiveRecord::Migration
  def change
    create_table :basic_exam_techniques do |t|

      t.references :component

      t.string :name
      t.text :notes

    end
  end
end
