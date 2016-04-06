class ExamTechniquesImageLinksJoinTable < ActiveRecord::Migration
  def change
    create_table :exam_techniques_image_links, :id => false do |t|

      t.references :exam_technique
      t.references :image_link

    end
  end
end
