class System < ActiveRecord::Base

  has_many :components
  has_many :exam_techniques

  validates :name, :uniqueness => true

  def self.api_all
    json = []

    System.all.each do |system|
      json.push({
        :system => system.as_json(:include => [:components, :exam_techniques])
      })
    end

    return json
  end

end