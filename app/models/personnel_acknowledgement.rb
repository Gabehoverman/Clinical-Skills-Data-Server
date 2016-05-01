class PersonnelAcknowledgement < ActiveRecord::Base

	validates :name, :uniqueness => true

	def self.api_all
		json = []

		PersonnelAcknowledgement.all.each do |personnelAcknowledgement|
			json.push(personnelAcknowledgement.as_json(root: true))
		end
		return json
	end
	
end