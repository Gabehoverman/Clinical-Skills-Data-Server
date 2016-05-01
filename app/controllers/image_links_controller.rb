class ImageLinksController < ApplicationController

  def index
    @toolbar_title = 'Image Links'
    js :new_image_link_dialog_template_url => ActionController::Base.helpers.asset_path('new_image_link_dialog.html')
    js :edit_exam_techniques_dialog_template_url => ActionController::Base.helpers.asset_path('edit_exam_techniques_dialog.html')
    js :edit_special_tests_dialog_template_url => ActionController::Base.helpers.asset_path('edit_special_tests_dialog.html')
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
    params.permit(:id, :title, :link)
  end

end