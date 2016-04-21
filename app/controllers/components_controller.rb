class ComponentsController < ApplicationController

  def index
    @toolbar_title = 'Components'
    js :new_component_dialog_template_url => ActionController::Base.helpers.asset_path('new_component_dialog.html')
    respond_to do |format|
      if params['system'].nil?
        format.json { render json: Component.api_all_associations, status: :ok }
      else
        format.json { render json: Component.api_for_system_name(params['system']), status: :ok }
      end
      format.html { render :index, status: :ok }
    end
  end

  def create
    @component = Component.new(components_params)
    respond_to do |format|
      if @component.save
        format.json { render json: { :component => @component.as_json }, status: :ok }
      else
        format.json { render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @component = Component.find(params[:id])
    unless params['system'].nil?
      @component.system = System.where(name: params['system']['name']).first
    end
    respond_to do |format|
      if @component.update(components_params)
        format.json { render json: @component, status: :ok }
      else
        format.json { render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @component = Component.find(params[:id])
    respond_to do |format|
      if @component.delete
        format.json { render json: @component, status: :ok }
      else
        format.json { render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def components_params
      params.permit(:id, :name, :inspection, :notes)
    end

end