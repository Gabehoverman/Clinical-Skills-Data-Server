class Muscle < ActiveRecord::Base

  belongs_to :component

  validates :name, :uniqueness => true

end
