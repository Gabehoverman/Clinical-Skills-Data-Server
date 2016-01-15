class ApiController < ApplicationController
  def systems
    @systems = System.where(parent: nil)
    respond_to do |format|
      format.html { render :systems }
      format.json { render json: @systems.as_json(:systems => true), status: :ok }
    end
  end

  def subsystems
    @subsystems = System.where.not(parent: nil)
    respond_to do |format|
      format.html { render :subsystems }
      format.json { render json: @subsystems.as_json(:subsystems => true), status: :ok }
    end
  end

  def detailed
    @detailed = System.all
    respond_to do |format|
      format.html { render :detailed }
      format.json { render json: @detailed.as_json(:detailed => true), status: :ok }
    end
  end

  def links
    @links = Link.all
    respond_to do |format|
      format.html { render :links }
      format.json { render json: @links.as_json(:links => true), status: :ok }
    end
  end
end