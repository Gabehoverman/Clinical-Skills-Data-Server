class ImageLinksController < ApplicationController

  def index
    @toolbar_title = 'Image Links'
    js :new_image_link_dialog_template_url => ActionController::Base.helpers.asset_path('new_image_link_dialog.html')
    js :edit_exam_techniques_dialog_template_url => ActionController::Base.helpers.asset_path('image_link_edit_exam_techniques_dialog.html')
    js :edit_special_tests_dialog_template_url => ActionController::Base.helpers.asset_path('image_link_edit_special_tests_dialog.html')
    respond_to do |format|
      if params['image_link'].nil?
        format.json { render json: ImageLink.api_all, status: :ok }
      else
        format.json { render json: ImageLink.api_for_image_link_name(params['image_link']), status: :ok }
      end
      format.html { render :index, status: :ok }
    end
  end

  def create
    @image_link = ImageLink.new(image_link_params)
    respond_to do |format|
      if @image_link.save
        format.json { render json: @image_link.as_json(root: true), status: :ok }
      else
        format.json { render json: @image_link.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @image_link = ImageLink.find(params[:id])
    @image_link.exam_techniques.clear
    unless params['exam_techniques'].nil?
      params['exam_techniques'].each do |e|
        exam_technique = ExamTechnique.find(e['id'])
        unless @image_link.exam_techniques.include?(exam_technique)
          @image_link.exam_techniques << exam_technique
        end
      end
    end
    @image_link.special_tests.clear
    unless params['special_tests'].nil?
      params['special_tests'].each do |e|
        special_test = SpecialTest.find(e['id'])
        unless @image_link.special_tests.include?(special_test)
          @image_link.special_tests << special_test
        end
      end
    end
    respond_to do |format|
      if @image_link.update(image_link_params)
        format.json { render json: @image_link, status: :ok }
      else
        format.json { render json: @image_link.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @image_link = ImageLink.find(params[:id])
    respond_to do |format|
      if @image_link.delete
        format.json { render json: @image_link, status: :ok }
      else
        format.json { render json: @image_link.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def image_link_params
    params.permit(:id, :title, :link, :image)
  end

end