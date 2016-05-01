class RangesOfMotionController < ApplicationController

  def index
    @toolbar_title = 'Ranges Of Motion'
    js :new_range_of_motion_dialog_template_url => ActionController::Base.helpers.asset_path('new_range_of_motion_dialog.html')
    respond_to do |format|
      if params['component'].nil?
        format.json { render json: RangeOfMotion.api_all, status: :ok }
      else
        format.json { render json: RangeOfMotion.api_for_component_name(params['component']), status: :ok }
      end
      format.html { render :index, status: :ok }
    end
  end

  def create
    @range_of_motion = RangeOfMotion.new(range_of_motion_params)
    unless params['component'].nil?
      @range_of_motion.component = Component.where(name: params['component']['name']).first
    end
    respond_to do |format|
      if @range_of_motion.save
        format.json { render json: @range_of_motion.as_json(root: true, include: { component: { only: [:id, :name] } }), status: :ok }
      else
        format.json { render json: @range_of_motion.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @range_of_motion = RangeOfMotion.find(params[:id])
    unless params['component'].nil?
      @range_of_motion.component = Component.where(name: params['component']['name']).first
    end
    respond_to do |format|
      if @range_of_motion.update(range_of_motion_params)
        format.json { render json: @range_of_motion, status: :ok }
      else
        format.json { render json: @range_of_motion.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @range_of_motion = RangeOfMotion.find(params[:id])
    respond_to do |format|
      if @range_of_motion.delete
        format.json { render json: @range_of_motion, status: :ok }
      else
        format.json { render json: @range_of_motion.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def range_of_motion_params
      params.permit(:id, :name, :component, :motion, :degrees, :notes)
    end

end
