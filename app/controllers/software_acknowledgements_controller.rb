class SoftwareAcknowledgementsController < ApplicationController

	def index
		@toolbar_title = 'Software Acknowledgements'
		js :new_software_acknowledgement_dialog_template_url => ActionController::Base.helpers.asset_path('new_software_acknowledgement_dialog.html')

		respond_to do |format|
			format.json { render  json: SoftwareAcknowledgement.api_all }
			format.html { render :index }
		end
	end

	def create
		@software_acknowledgement = SoftwareAcknowledgement.new(software_acknowledgement_params)
		respond_to do |format|
			if @software_acknowledgement.save
				format.json { render json: { :software_acknowledgement => @software_acknowledgement.as_json }, status: :ok }
			else
				format.json { render json: @software_acknowledgement.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		@software_acknowledgement = SoftwareAcknowledgement.find(params[:id])
		respond_to do |format|
			if @software_acknowledgement.update(software_acknowledgement_params)
				format.json { render json: @software_acknowledgement, status: :ok }
			else
				format.json { render json: @software_acknowledgement.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@software_acknowledgement = SoftwareAcknowledgement.find(params[:id])
		respond_to do |format|
			if @software_acknowledgement.delete
				format.json { render json: @software_acknowledgement, status: :ok }
			else
				format.json { render json: @software_acknowledgement.errors, status: :unprocessable_entity }
			end
		end
	end

	private

	def software_acknowledgement_params
		params.permit(:id, :name, :link)
	end

end
