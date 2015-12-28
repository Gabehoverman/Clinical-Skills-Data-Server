class SystemsController < ApplicationController
  def systems
    @systems = System.where(parent: nil)
    respond_to do |format|
      format.html { render :base }
      format.json { render json: @systems, status: :ok }
    end
  end

  def subsystems
    @systems = System.where.not(parent: nil)
    respond_to do |format|
      format.html { render :base }
      format.json { render json: @systems, status: :ok }
    end
  end

  def all
    @systems = System.all
    respond_to do |format|
      format.html { render :base }
      format.json { render json: @systems, status: :ok }
    end
  end
end