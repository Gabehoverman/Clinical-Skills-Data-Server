class PalpationsController < ApplicationController

  def index
    json = []

    unless params[:component].nil?
      @component = Component.where('lower(name) = ?', params[:component].downcase).first
      unless @component.nil?
        @palpations = @component.palpations
        @palpations.each do |palpation|
          json.push({
            :palpation => palpation
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