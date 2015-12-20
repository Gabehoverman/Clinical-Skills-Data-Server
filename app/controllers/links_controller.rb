class LinksController < ApplicationController
  def all
    @links = Link.all
    respond_to do |format|
      format.html { render :all }
      format.json { render json: @links, status: :ok }
    end
  end
end
