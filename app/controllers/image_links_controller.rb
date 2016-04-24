class ImageLinksController < ApplicationController

  def index
    @toolbar_title = 'Image Links'
    respond_to do |format|
      if params['special_test'].nil?
        format.json { render json: ImageLink.api_all, status: :ok }
      else
        format.json { render json: ImageLink.api_for_special_test_name(params['special_test']), status: :ok }
      end
      format.html { render :index, status: :ok }
    end
  end

end