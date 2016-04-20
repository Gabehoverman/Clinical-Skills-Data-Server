class ComponentsController < ApplicationController

  def index
    @toolbar_title = 'Components'
    respond_to do |format|
      if params['system'].nil?
        format.json { render json: Component.api_all, status: :ok }
      else
        format.json { render json: Component.api_for_system_name(params['system']), status: :ok }
      end
      format.html { render :index, status: :ok }
    end
  end

end