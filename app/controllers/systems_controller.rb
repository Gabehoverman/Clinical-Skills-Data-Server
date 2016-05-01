class SystemsController < ApplicationController

  def count
    respond_to do |format|
      format.json { render  json: System.count }
    end
  end

  def index
    @toolbar_title = 'Systems'
    js :new_system_dialog_template_url => ActionController::Base.helpers.asset_path('new_system_dialog.html')
    js :edit_components_dialog_template_url => ActionController::Base.helpers.asset_path('system_edit_components_dialog.html')
    js :edit_exam_techniques_dialog_template_url => ActionController::Base.helpers.asset_path('system_edit_exam_techniques_dialog.html')

    respond_to do |format|
      format.json { render  json: System.api_all_associations }
      format.html { render :index }
    end

  end

  def create
    @system = System.new(system_params)
    @system.components = []
    @system.exam_techniques = []
    unless params['components'].nil?
      params['components'].each do |component|
        @system.components << component
      end
    end
    unless params['exam_techniques'].nil?
      params['exam_techniques'].each do |exam_technique|
        @system.exam_techniques << exam_technique
      end
    end
    respond_to do |format|
      if @system.save
        format.json { render json: { :system => @system.as_json }, status: :ok }
      else
        format.json { render json: @system.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @system = System.find(params[:id])
    @system.components.clear
    unless params['components'].nil?
      params['components'].each do |c|
        component = Component.find(c['id'])
        unless @system.components.include?(component)
          @system.components << component
        end
      end
    end
    @system.exam_techniques.clear
    unless params['exam_techniques'].nil?
      params['exam_techniques'].each do |e|
        exam_technique = ExamTechnique.find(e['id'])
        unless @system.exam_techniques.include?(exam_technique)
          @system.exam_techniques << exam_technique
        end
      end
    end
    respond_to do |format|
      if @system.update(system_params)
        format.json { render json: @system, status: :ok }
      else
        format.json { render json: @system.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @system = System.find(params[:id])
    respond_to do |format|
      if @system.delete
        format.json { render json: @system, status: :ok }
      else
        format.json { render json: @system.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def system_params
      params.permit(:id, :name, :details)
    end

end