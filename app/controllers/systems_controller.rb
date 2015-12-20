class SystemsController < ApplicationController
  def all
    @systems = System.all
    respond_to do |format|
      format.html { render :all }
      format.json { render json: @systems, status: :ok }
    end
  end
end