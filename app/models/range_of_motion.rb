class RangeOfMotion < ActiveRecord::Base

  belongs_to :component

  validates :motion, :uniqueness => true

end
