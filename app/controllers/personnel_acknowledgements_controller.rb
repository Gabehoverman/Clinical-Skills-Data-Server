class PersonnelAcknowledgementsController < ApplicationController

	def index
		respond_to do |format|
			format.json { render  json:  PersonnelAcknowledgement.all.as_json(root: true)}
		end
	end

end
