class VideoLinksController < ApplicationController

  def index
    json = []
    unless params[:special_test].nil?
      @special_test = SpecialTest.where('lower(name) = ?', params[:special_test].downcase).first
      unless @special_test.nil?
        @video_links = @special_test.video_links
        @video_links.each do |video_link|
          json.push({
            :video_link => video_link
          })
        end
      end
    end

    unless params[:exam_technique].nil?
      @exam_technique = ExamTechnique.where('lower(name) = ?', params[:exam_technique].downcase).first
      unless @exam_technique.nil?
        @video_links = @exam_technique.video_links
        @video_links.each do |video_link|
          json.push({
            :video_link => video_link
          })
        end
      end
    end

    respond_to do |format|
      format.html { render :index }
      format.json { render json: json, status: :ok }
    end

  end

end