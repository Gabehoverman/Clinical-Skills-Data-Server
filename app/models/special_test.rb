class SpecialTest < ActiveRecord::Base

  belongs_to :component

  has_and_belongs_to_many :image_links
  has_and_belongs_to_many :video_links

end
