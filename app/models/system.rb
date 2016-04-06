class System < ActiveRecord::Base

  has_many :components
  has_many :exam_techniques

  validates :name, :uniqueness => true

end