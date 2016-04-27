class ExamTechniquesController < ApplicationController

  def index
    @toolbar_title = 'Exam Techniques'
    js :new_exam_technique_dialog_template_url => ActionController::Base.helpers.asset_path('new_exam_technique_dialog.html')

    respond_to do |format|
      if params['system'].nil?
        format.json { render json: ExamTechnique.api_all, status: :ok }
      else
        format.json { render json: ExamTechnique.api_for_system_name(params['system']), status: :ok }
      end
      format.html { render :index, status: :ok }
    end
  end

  def create
    @exam_technique = ExamTechnique.new(exam_technique_params)
    respond_to do |format|
      if @exam_technique.save
        format.json { render json: @exam_technique.as_json(root: true), status: :ok }
      else
        format.json { render json: @system.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @exam_technique = ExamTechnique.find(params[:id])
    respond_to do |format|
      if @exam_technique.update(exam_technique_params)
        format.json { render json: @exam_technique.as_json, status: :ok }
      else
        format.json { render json: @exam_technique.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @exam_technique = ExamTechnique.find(params[:id])
    respond_to do |format|
      if @exam_technique.delete
        format.json { render json: @exam_technique.as_json, status: :ok }
      else
        format.json { render json: @exam_technique.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def exam_technique_params
      params.permit(:id, :name, :details)
    end

end