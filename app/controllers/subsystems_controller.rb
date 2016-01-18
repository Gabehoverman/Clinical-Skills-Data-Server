class SubsystemsController < ApplicationController

  def index
    @toolbar_title = 'Subsystem'
    @subsystems = System.where.not(parent: nil)

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @subsystems.as_json(:subsystems => true), status: :ok }
    end
  end

  def create
    @subsystem = System.new(subsystem_params)
    add_parent
    add_links

    respond_to do |format|
      if @subsystem.save
        format.js { render json: @subsystem.as_json(:subsystems => true), status: :ok }
        format.json { render json: @subsystem.as_json(:subsystems => true), status: :ok }
      else
        format.js { render json: @subsystem.errors, status: :unprocessable_entity }
        format.json { render json: @subsystem.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @subsystem = System.find(params[:id])
    add_parent

    @subsystem.links.clear
    add_links

    respond_to do |format|
      if @subsystem.update(subsystem_params)
        format.js { render json: @subsystem.as_json(:subsystems => true), status: :ok }
        format.json { render json: @subsystem.as_json(:subsystems => true), status: :ok }
      else
        format.js { render json: @subsystem.errors, status: :unprocessable_entity }
        format.json { render json: @subsystem.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @subsystem = System.find(params['id'])

    respond_to do |format|
      if @subsystem.delete
        format.js { render json: @subsystem.as_json(:subsystems => true), status: :ok }
        format.json { render json: @subsystem.as_json(:subsystems => true), status: :ok }
      else
        format.js { render json: @subsystem.errors, status: :unprocessable_entity }
        format.json { render json: @subsystem.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def subsystem_params
      params.permit(:name, :details, :visible)
    end

    def add_parent
      unless params['parent_name'].nil?
        @subsystem.parent = System.where(:name => params['parent_name']).first
      end
    end

    def add_links
      unless params['links'].nil?
        params['links'].each do |l|
          link = Link.find(l['link']['id'])
          unless @subsystem.links.include?(link)
            @subsystem.links << link
          end
        end
      end
    end
    
end
