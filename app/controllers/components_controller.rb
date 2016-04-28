class ComponentsController < ApplicationController

  def index
    @toolbar_title = 'Components'
    js :new_component_dialog_template_url => ActionController::Base.helpers.asset_path('new_component_dialog.html')
    js :edit_muscles_dialog_template_url => ActionController::Base.helpers.asset_path('edit_muscles_dialog.html')
    js :edit_palpations_dialog_template_url => ActionController::Base.helpers.asset_path('edit_palpations_dialog.html')
    js :edit_ranges_of_motion_dialog_template_url => ActionController::Base.helpers.asset_path('edit_ranges_of_motion_dialog.html')
    js :edit_special_tests_dialog_template_url => ActionController::Base.helpers.asset_path('edit_special_tests_dialog.html')
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
    @component = Component.new(component_params)
    unless params['system'].nil?
      @component.system = System.where(name: params['system']['name']).first
    end
    respond_to do |format|
      if @component.save
        format.json { render json: { :component => @component.as_json(include: { system: { only: [:id, :name] } }) }, status: :ok }
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
    @component.muscles.clear
    unless params['muscles'].nil?
      params['muscles'].each do |muscle|
        muscle = Muscle.find(muscle['id'])
        unless @component.muscles.include?(muscle)
          @component.muscles << muscle
        end
      end
    end
    @component.palpations.clear
    unless params['palpations'].nil?
      params['palpations'].each do |palpation|
        palpation = Palpation.find(palpation['id'])
        unless @component.palpations.include?(palpation)
          @component.palpations << palpation
        end
      end
    end
    @component.range_of_motions.clear
    unless params['ranges_of_motion'].nil?
      params['ranges_of_motion'].each do |range_of_motion|
        range_of_motion = RangeOfMotion.find(range_of_motion['id'])
        unless @component.range_of_motions.include?(range_of_motion)
          @component.range_of_motions << range_of_motion
        end
      end
    end
    @component.special_tests.clear
    unless params['special_tests'].nil?
      params['special_tests'].each do |special_test|
        special_test = SpecialTest.find(special_test['id'])
        unless @component.special_tests.include?(special_test)
          @component.special_tests << special_test
        end
      end
    end
    respond_to do |format|
      if @component.update(component_params)
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

    def component_params
      params.permit(:id, :name, :inspection, :notes)
    end

end