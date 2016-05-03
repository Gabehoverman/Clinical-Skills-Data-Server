class SpecialTestsController < ApplicationController

  def index

    @toolbar_title = 'Special Tests'
    js :new_special_test_dialog_template_url => ActionController::Base.helpers.asset_path('new_special_test_dialog.html')
    js :edit_image_links_dialog_template_url => ActionController::Base.helpers.asset_path('special_test_edit_image_links_dialog.html')
    js :edit_video_links_dialog_template_url => ActionController::Base.helpers.asset_path('special_test_edit_video_links_dialog.html')
    respond_to do |format|
      if params['component'].nil?
        format.json { render json: SpecialTest.api_all, status: :ok }
      else
        format.json { render json: SpecialTest.api_for_component_name(params['component']), status: :ok }
      end
      format.html { render :index, status: :ok }
    end
    
  end

  def create
    @special_test = SpecialTest.new(special_test_params)
    unless params['component'].nil?
      @special_test.component = Component.where(name: params['component']['name']).first
    end
    respond_to do |format|
      if @special_test.save
        format.json { render json: @special_test.as_json(root: true, include: { component: { only: [:id, :name] } }), status: :ok }
      else
        format.json { render json: @special_test.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @special_test = SpecialTest.find(params[:id])
    unless params['component'].nil?
      @special_test.component = Component.where(name: params['component']['name']).first
    end
    respond_to do |format|
      if @special_test.update(special_test_params)
        format.json { render json: @special_test, status: :ok }
      else
        format.json { render json: @special_test.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @special_test = SpecialTest.find(params[:id])
    respond_to do |format|
      if @special_test.delete
        format.json { render json: @special_test, status: :ok }
      else
        format.json { render json: @special_test.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def special_test_params
    params.permit(:id, :name, :component, :positive_sign, :indication, :notes)
  end

end