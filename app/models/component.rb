class Component < ActiveRecord::Base

  belongs_to :system

  has_many :palpations
  has_many :range_of_motions
  has_many :muscles

  has_one :basic_exam_technique
  has_many :special_tests

  validates :name, :uniqueness => true

end
