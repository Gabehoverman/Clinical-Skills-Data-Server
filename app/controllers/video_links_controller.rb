class VideoLinksController < ApplicationController

  def index
    @toolbar_title = 'Video Links'
    respond_to do |format|
      if not params['special_test'].nil?
        format.json { render json: VideoLink.api_for_special_test_name(params['special_test']), status: :ok }
      elsif not params['exam_technique'].nil?
        format.json { render json: VideoLink.api_for_exam_technique_name(params['exam_technique']), status: :ok }
      else
        format.json { render json: VideoLink.api_all, status: :ok }
      end
      format.html { render :index, status: :ok }
    end
  end

end