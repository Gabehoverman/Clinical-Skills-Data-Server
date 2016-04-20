class PalpationsController < ApplicationController

  def index
    @toolbar_title = 'Palpations'
    respond_to do |format|
      if params['component'].nil?
        format.json { render json: Palpation.api_all, status: :ok }
      else
        format.json { render json: Palpation.api_for_component_name(params['component']), status: :ok }
      end
      format.html { render :index, status: :ok }
    end
  end

end