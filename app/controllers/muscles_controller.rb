class MusclesController < ApplicationController

  def index
    @toolbar_title = 'Muscles'
    js :new_muscle_dialog_template_url => ActionController::Base.helpers.asset_path('new_muscle_dialog.html')
    respond_to do |format|
      if params['component'].nil?
        format.json { render json: Muscle.api_all, status: :ok }
      else
        format.json { render json: Muscle.api_for_component_name(params['component']), status: :ok }
      end
      format.html { render :index, status: :ok }
    end
  end

  def create
    @muscle = Muscle.new(muscle_params)
    unless params['component'].nil?
      @muscle.component = Component.where(name: params['component']['name']).first
    end
    respond_to do |format|
      if @muscle.save
        format.json { render json: @muscle.as_json(root: true, include: { component: { only: [:id, :name] } }), status: :ok }
      else
        format.json { render json: @muscle.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @muscle = Muscle.find(params[:id])
    unless params['component'].nil?
      @muscle.component = Component.where(name: params['component']['name']).first
    end
    respond_to do |format|
      if @muscle.update(muscle_params)
        format.json { render json: @muscle, status: :ok }
      else
        format.json { render json: @muscle.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @muscle = Muscle.find(params[:id])
    respond_to do |format|
      if @muscle.delete
        format.json { render json: @muscle, status: :ok }
      else
        format.json { render json: @muscle.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def muscle_params
      params.permit(:id, :name, :component)
    end

end
