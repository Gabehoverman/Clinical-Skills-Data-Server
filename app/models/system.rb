class System < ActiveRecord::Base

  has_many :components
  has_many :exam_techniques

  validates :name, :uniqueness => true

  def self.api_all
    json = []

    System.all.each do |system|
      json.push(
        system.as_json(root: true, include: {
            components: { only: [:id, :name] },
            exam_techniques: { only: [:id, :name] }
          }
        )
      )
    end

    return json
  end

end