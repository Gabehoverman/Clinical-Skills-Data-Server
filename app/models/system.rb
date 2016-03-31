class System < ActiveRecord::Base

  has_many :components
  has_many :basic_exam_techniques

  validates :name, :uniqueness => true

end