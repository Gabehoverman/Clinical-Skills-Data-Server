class SoftwareAcknowledgementsController < ApplicationController

	def index
		respond_to do |format|
			format.json { render  json:  SoftwareAcknowledgement.all.as_json(root: true)}
		end
	end

end
