class PersonnelAcknowledgementsController < ApplicationController

	def index
		@toolbar_title = 'Personnel Acknowledgements'
		js :new_personnel_acknowledgement_dialog_template_url => ActionController::Base.helpers.asset_path('new_personnel_acknowledgement_dialog.html')

		respond_to do |format|
			format.json { render  json: PersonnelAcknowledgement.api_all }
			format.html { render :index }
		end
	end

	def create
		@personnel_acknowledgement = PersonnelAcknowledgement.new(personnel_acknowledgement_params)
		respond_to do |format|
			if @personnel_acknowledgement.save
				format.json { render json: { :personnel_acknowledgement => @personnel_acknowledgement.as_json }, status: :ok }
			else
				format.json { render json: @personnel_acknowledgement.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		@personnel_acknowledgement = PersonnelAcknowledgement.find(params[:id])
		respond_to do |format|
			if @personnel_acknowledgement.update(personnel_acknowledgement_params)
				format.json { render json: @personnel_acknowledgement, status: :ok }
			else
				format.json { render json: @personnel_acknowledgement.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@personnel_acknowledgement = PersonnelAcknowledgement.find(params[:id])
		respond_to do |format|
			if @personnel_acknowledgement.delete
				format.json { render json: @personnel_acknowledgement, status: :ok }
			else
				format.json { render json: @personnel_acknowledgement.errors, status: :unprocessable_entity }
			end
		end
	end

	private

	def personnel_acknowledgement_params
		params.permit(:id, :name, :role, :notes)
	end

end
