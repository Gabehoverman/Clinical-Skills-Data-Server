class SystemsController < ApplicationController

  def index
    @toolbar_title = 'Systems'
    @systems = System.where(parent: nil)
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @systems, status: :ok }
    end
  end

  # def show

  # end

  def new
    @toolbar_title = 'New System'
    @system = System.new(systems_params)
    # if @system.save
    #   puts 'CREATION SUCCESSFUL'
    # else
    #   puts 'CREATION FAILED'
    # end
  end

  # def create

  # end

  def edit
    @toolbar_title = 'Edit System'
    @system = System.find(params[:id])
    # if @system.update(systems_params)
    #   puts 'UPDATE SUCCESSFUL'
    # else
    #   puts 'UPDATE FAILED'
    # end
  end

  # def update

  # end

  # def destroy

  # end

  private

    def systems_params
      params.permit(:name, :details, :visible)
    end

end