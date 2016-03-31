class Palpation < ActiveRecord::Base

  belongs_to :component

  validates :structure, :uniqueness => true

end
