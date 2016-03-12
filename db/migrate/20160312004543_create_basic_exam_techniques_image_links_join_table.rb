class CreateBasicExamTechniquesImageLinksJoinTable < ActiveRecord::Migration
  def change
    create_table :basic_exam_techniques_image_links, :id => false do |t|
      t.references :basic_exam_technique
      t.references :image_link
    end
  end
end
