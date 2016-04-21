class Component < ActiveRecord::Base

  belongs_to :system

  has_many :palpations
  has_many :range_of_motions
  has_many :muscles

  has_many :special_tests

  validates :name, :uniqueness => true

	def self.api_all
		json = []
		Component.all.each do |component|
			json.push(
				component.as_json(root: true, include: {
						system: { only: [:id, :name] },
						palpations: { only: [:id, :structure] },
						muscles: { only: [:id, :name] },
						range_of_motions: { only: [:id, :motion] },
						special_tests: { only: [:id, :name] }
					}
				)
			)
		end
		return json
	end

	def self.api_for_system_name(system_name)
		json = []
		system = System.where('lower(name) = ?', system_name.downcase).first
		unless system.nil?
			components = system.components
			components.each do |component|
			json.push(
				component.as_json(root: true, include: {
						system: { only: [:id, :name] },
						palpations: { only: [:id, :structure] },
						muscles: { only: [:id, :name] },
						range_of_motions: { only: [:id, :motion] },
						special_tests: { only: [:id, :name] }
					}
				)
			)
			end
		end
		return json
	end

end
