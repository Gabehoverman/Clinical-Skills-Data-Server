class VideoLink < ActiveRecord::Base

  belongs_to :basic_exam_technique
  belongs_to :special_test

end
