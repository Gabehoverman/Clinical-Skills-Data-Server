class SystemsController < ApplicationController

  skip_before_action :verify_authenticity_token, :only => :create

  def index
    @toolbar_title = 'Systems'
    js :systems_url => url_for(:action => :all)
    js :system_post_url => url_for(:action => :create)
    js :system_patch_url => systems_url
    js :new_system_dialog_template_url => ActionController::Base.helpers.asset_path('new_system_dialog.html')
    js :edit_components_dialog_template_url => ActionController::Base.helpers.asset_path('edit_components_dialog.html')
    js :edit_exam_techniques_dialog_template_url => ActionController::Base.helpers.asset_path('edit_exam_techniques_dialog.html')
    # js :edit_links_dialog_template_url => ActionController::Base.helpers.asset_path('edit_links_dialog.html')
    # js :new_link_dialog_template_url => ActionController::Base.helpers.asset_path('new_link_dialog.html')
  end

  def all
    @systems = System.all
    json = []

    @systems.each do |system|
      json.push({
        :system => system.as_json(:include => [:components, :exam_techniques])
      })
    end

    respond_to do |format|
      format.all { render json: json, status: :ok }
    end
  end

  def create
    @system = System.new(system_params)
    respond_to do |format|
      if @system.save
        format.js { render json: @system, status: :ok }
        format.json { render json: @system, status: :ok }
      else
        format.js { render json: @system.errors, status: :unprocessable_entity }
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
        format.js { render json: @system, status: :ok }
        format.json { render json: @system, status: :ok }
      else
        format.js { render json: @system.errors, status: :unprocessable_entity }
        format.json { render json: @system.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @system = System.find(params[:id])
    respond_to do |format|
      if @system.delete
        format.js { render json: @system, status: :ok }
        format.json { render json: @system, status: :ok }
      else
        format.js { render json: @system.errors, status: :unprocessable_entity }
        format.json { render json: @system.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def system_params
      params.permit(:id, :name, :details)
    end

end