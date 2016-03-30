class MusclesController < ApplicationController

  def index
    json = []

    unless params[:component].nil?
      @component = Component.where('lower(name) = ?', params[:component].downcase).first
      unless @component.nil?
        @muscles = @component.muscles
        @muscles.each do |muscle|
          json.push({
            :muscle => muscle
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
