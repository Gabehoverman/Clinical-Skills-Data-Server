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
			json.push({
				:component => component.as_json
			})
		end
		return json
	end

	def self.api_for_system_name(system_name)
		json = []
		system = System.where(:name => system_name).first
		unless system.nil?
			components = system.components
			components.each do |component|
			json.push({
				:component => component.as_json
			})
			end
		end
		return json
	end

end
