class RangesOfMotionController < ApplicationController

  def index
    json = []

    unless params[:component].nil?
      @component = Component.where('lower(name) = ?', params[:component].downcase).first
      unless @component.nil?
        @ranges_of_motion = @component.range_of_motions
        @ranges_of_motion.each do |range_of_motion|
          json.push({
            :range_of_motion => range_of_motion
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
