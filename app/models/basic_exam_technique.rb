class BasicExamTechnique < ActiveRecord::Base

  belongs_to :component
  has_many :image_links
  has_many :video_links

end
