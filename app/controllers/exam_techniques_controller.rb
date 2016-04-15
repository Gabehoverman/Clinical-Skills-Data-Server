class ExamTechniquesController < ApplicationController

  def index
    json = []

    unless params[:system].nil?
      @system = System.where('lower(name) = ?', params[:system].downcase).first
      unless @system.nil?
        @exam_techniques = @system.exam_techniques
        @exam_techniques.each do |exam_technique|
          json.push({
            :exam_technique => exam_technique
          })
        end
      end
    end

    respond_to do |format|
      format.html { render :index }
      format.json { render json: json, status: :ok }
    end

  end

  def all
    @exam_techniques = ExamTechnique.all
    json = []

    @exam_techniques.each do |exam_technique|
      json.push({
        :exam_technique => exam_technique
      })
    end

    respond_to do |format|
      format.all { render json: json, status: :ok }
    end
  end

end
