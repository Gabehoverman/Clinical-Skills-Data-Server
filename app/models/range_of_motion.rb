class RangeOfMotion < ActiveRecord::Base

  belongs_to :component

  validates :motion, :uniqueness => true

	def self.api_all
		json = []
		RangeOfMotion.all.each do |range_of_motion|
			json.push(range_of_motion.as_json(root: true, include: { component: { only: [:id, :name] } }))
		end
		return json
	end

	def self.api_for_component_name(component_name)
		json = []
		component = Component.where('lower(name) = ?', component_name.downcase).first
		unless component.nil?
			ranges_of_motion = component.range_of_motions
			ranges_of_motion.each do |range_of_motion|
				json.push(range_of_motion.as_json(root: true, include: { component: { only: [:id, :name] } }))
			end
		end
		return json
	end

end
