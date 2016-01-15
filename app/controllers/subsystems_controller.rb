class SubsystemsController < ApplicationController

  def index
    @toolbar_title = 'Subsystem'
    @subsystems = System.where.not(parent: nil)
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @subsystems.as_json(:subsystems => true), status: :ok }
    end
  end

  # def show

  # end

  def new
    @toolbar_title = 'New Subsystem'
    @subsystem = System.new(subsystems_params)
    # if @subsystem.save
    #   puts 'CREATION SUCCESSFUL'
    # else
    #   puts 'CREATION FAILED'
    # end
  end

  # def create

  # end

  def edit
    @toolbar_title = 'Edit Subsystem'
    @subsystem = System.find(params[:id])
    # if @subsystem.update(subsystems_params)
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

    def subsystems_params
      params.permit(:name, :details, :visible)
    end
    
end
