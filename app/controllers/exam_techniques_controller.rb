class ExamTechniquesController < ApplicationController

  def index
    @toolbar_title = 'Exam Techniques'
    respond_to do |format|
      if params['system'].nil?
        format.json { render json: ExamTechnique.api_all, status: :ok }
      else
        format.json { render json: ExamTechnique.api_for_system_name(params['system']), status: :ok }
      end
      format.html { render :index, status: :ok }
    end
  end

end