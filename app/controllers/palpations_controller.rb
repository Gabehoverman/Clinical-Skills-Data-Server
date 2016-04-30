class PalpationsController < ApplicationController

  def index
    @toolbar_title = 'Palpations'
    js :new_palpation_dialog_template_url => ActionController::Base.helpers.asset_path('new_palpation_dialog.html')
    respond_to do |format|
      if params['component'].nil?
        format.json { render json: Palpation.api_all, status: :ok }
      else
        format.json { render json: Palpation.api_for_component_name(params['component']), status: :ok }
      end
      format.html { render :index, status: :ok }
    end
  end

  def create
    @palpation = Palpation.new(palpation_params)
    unless params['component'].nil?
      @palpation.component = Component.where(name: params['component']['name']).first
    end
    respond_to do |format|
      if @palpation.save
        format.json { render json: @palpation.as_json(root: true, include: { component: { only: [:id, :name] } }), status: :ok }
      else
        format.json { render json: @palpation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @palpation = Palpation.find(params[:id])
    unless params['component'].nil?
      @palpation.component = Component.where(name: params['component']['name']).first
    end
    respond_to do |format|
      if @palpation.update(palpation_params)
        format.json { render json: @palpation, status: :ok }
      else
        format.json { render json: @palpation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @palpation = Palpation.find(params[:id])
    respond_to do |format|
      if @palpation.delete
        format.json { render json: @palpation, status: :ok }
      else
        format.json { render json: @palpation.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def palpation_params
      params.permit(:id, :name, :component, :structure, :details, :notes)
    end

end