class Muscle < ActiveRecord::Base

  belongs_to :component

  validates :name, :uniqueness => true

	def self.api_all
		json = []
		Muscle.all.each do |muscle|
			json.push(muscle.as_json(root: true, include: { component: { only: [:id, :name] } }))
		end
		return json
	end

	def self.api_for_component_name(component_name)
		json = []
		component = Component.where('lower(name) = ?', component_name.downcase).first
		unless component.nil?
			muscles = component.muscles
			muscles.each do |muscle|
				json.push(muscle.as_json(root: true, include: { component: { only: [:id, :name] } }))
			end
		end
		return json
	end

end
