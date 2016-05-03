class Palpation < ActiveRecord::Base

  belongs_to :component

  validates :structure, :presence => true
  validates :structure, :uniqueness => true

	def self.api_all
		json = []
		Palpation.all.each do |palpation|
			json.push(palpation.as_json(root: true, include: { component: { only: [:id, :name] } }))
		end
		return json
	end

	def self.api_for_component_name(component_name)
		json = []
		component = Component.where('lower(name) = ?', component_name.downcase).first
		unless component.nil?
			palpations = component.palpations
			palpations.each do |palpation|
				json.push(palpation.as_json(root: true, include: { component: { only: [:id, :name] } }))
			end
		end
		return json
	end

end
