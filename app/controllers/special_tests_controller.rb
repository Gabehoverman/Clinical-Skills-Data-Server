class SpecialTestsController < ApplicationController

  def index
    json = []

    unless params[:component].nil?
      @component = Component.where('lower(name) = ?', params[:component].downcase).first
      unless @component.nil?
        @special_tests = @component.special_tests
        @special_tests.each do |special_test|
          json.push({
            :special_test => special_test
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
