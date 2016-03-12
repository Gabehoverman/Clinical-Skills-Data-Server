class CreateBasicExamTechniquesVideoLinksJoinTable < ActiveRecord::Migration
  def change
    create_table :basic_exam_techniques_video_links, :id => false do |t|
      t.references :basic_exam_technique
      t.references :video_link
    end
  end
end
