class CreateImageLinks < ActiveRecord::Migration
  def change
    create_table :image_links do |t|

      t.references :basic_exam_technique
      t.references :special_test

      t.string :title
      t.string :link

    end
  end
end
