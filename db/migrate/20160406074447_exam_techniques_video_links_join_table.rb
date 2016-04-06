class ExamTechniquesVideoLinksJoinTable < ActiveRecord::Migration
  def change
    create_table :exam_techniques_video_links, :id => false do |t|

      t.references :exam_technique
      t.references :video_link

    end
  end
end
