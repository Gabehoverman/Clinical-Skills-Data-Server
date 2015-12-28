class DataController < ApplicationController
  def systems
    @systems = System.where(parent: nil)
    respond_to do |format|
      format.html { render :systems }
      format.json { render json: @systems, status: :ok }
    end
  end

  def subsystems
    @systems = System.where.not(parent: nil)
    respond_to do |format|
      format.html { render :subsystems }
      format.json { render json: @systems, status: :ok }
    end
  end

  def detailed
    @systems = System.all
    respond_to do |format|
      format.html { render :detailed }
      format.json { render json: @systems, status: :ok }
    end
  end

  def links
    @links = Link.all
    respond_to do |format|
      format.html { render :links }
      format.json { render json: @links, status: :ok }
    end
  end
end
