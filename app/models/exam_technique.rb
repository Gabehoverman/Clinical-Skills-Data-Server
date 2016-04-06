class ExamTechnique < ActiveRecord::Base

  belongs_to :system

  has_and_belongs_to_many :image_links
  has_and_belongs_to_many :video_links

  validates :name, :uniqueness => true

end
