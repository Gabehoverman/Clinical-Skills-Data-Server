class VideoLinksController < ApplicationController

  def index
    @toolbar_title = 'Video Links'
    js :new_video_link_dialog_template_url => ActionController::Base.helpers.asset_path('new_video_link_dialog.html')
    js :edit_exam_techniques_dialog_template_url => ActionController::Base.helpers.asset_path('video_link_edit_exam_techniques_dialog.html')
    js :edit_special_tests_dialog_template_url => ActionController::Base.helpers.asset_path('video_link_edit_special_tests_dialog.html')
    respond_to do |format|
      if not params['special_test'].nil?
        format.json { render json: VideoLink.api_for_special_test_name(params['special_test']), status: :ok }
      elsif not params['exam_technique'].nil?
        format.json { render json: VideoLink.api_for_exam_technique_name(params['exam_technique']), status: :ok }
      elsif not params['system'].nil?
        format.json { render json: VideoLink.api_for_system_name(params['system']), status: :ok }
      else
        format.json { render json: VideoLink.api_all, status: :ok }
      end
      format.html { render :index, status: :ok }
    end
  end

  def create
    @video_link = VideoLink.new(video_link_params)
    respond_to do |format|
      if @video_link.save
        format.json { render json: @video_link.as_json(root: true), status: :ok }
      else
        format.json { render json: @video_link.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @video_link = VideoLink.find(params[:id])
    @video_link.exam_techniques.clear
    unless params['exam_techniques'].nil?
      params['exam_techniques'].each do |e|
        exam_technique = ExamTechnique.find(e['id'])
        unless @video_link.exam_techniques.include?(exam_technique)
          @video_link.exam_techniques << exam_technique
        end
      end
    end
    @video_link.special_tests.clear
    unless params['special_tests'].nil?
      params['special_tests'].each do |e|
        special_test = SpecialTest.find(e['id'])
        unless @video_link.special_tests.include?(special_test)
          @video_link.special_tests << special_test
        end
      end
    end
    respond_to do |format|
      if @video_link.update(video_link_params)
        format.json { render json: @video_link, status: :ok }
      else
        format.json { render json: @video_link.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @video_link = VideoLink.find(params[:id])
    respond_to do |format|
      if @video_link.delete
        format.json { render json: @video_link, status: :ok }
      else
        format.json { render json: @video_link.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def video_link_params
      params.permit(:id, :title, :link)
    end

end