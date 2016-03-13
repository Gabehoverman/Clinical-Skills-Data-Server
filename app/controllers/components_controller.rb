class ComponentsController < ApplicationController

  def index
    json = []

    unless params[:system].nil?
      @system = System.where('lower(name) = ?', params[:system].downcase).first
      unless @system.nil?
        @components = @system.components
        @components.each do |component|
          json.push({
              :component => component
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
