class ImageLinksController < ApplicationController

  def index
    json = []
    unless params[:special_test].nil?
      @special_test = SpecialTest.where('lower(name) = ?', params[:special_test].downcase).first
      unless @special_test.nil?
        @image_links = @special_test.image_links
        @image_links.each do |image_link|
          json.push({
            :image_link => image_link
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