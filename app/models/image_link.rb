class ImageLink < ActiveRecord::Base

  has_and_belongs_to_many :basic_exam_techniques
  has_and_belongs_to_many :special_tests

end
