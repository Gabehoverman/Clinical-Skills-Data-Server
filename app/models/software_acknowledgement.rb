class SoftwareAcknowledgement < ActiveRecord::Base

	validates :name, :presence => true
	validates :name, :uniqueness => true

	def self.api_all
		json = []

		SoftwareAcknowledgement.all.each do |softwareAcknowledgement|
			json.push(softwareAcknowledgement.as_json(root: true))
		end
		return json
	end

end