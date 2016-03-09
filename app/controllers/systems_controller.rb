class SystemsController < ApplicationController

  skip_before_action :verify_authenticity_token, :only => :create

  def index
    @toolbar_title = 'Systems'
    @systems = System.all

    json = []

    @systems.each do |system|
      json.push({
        :system => system.as_json
      })
    end

    respond_to do |format|
      format.html { render :index }
      format.json { render json: json, status: :ok }
    end
  end

  def create
    @system = System.new(system_params)
    add_links

    respond_to do |format|
      if @system.save
        format.js { render json: @system, status: :ok }
        format.json { render json: @system, status: :ok }
      else
        format.js { render json: @system.errors, status: :unprocessable_entity }
        format.json { render json: @system.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @system = System.find(params[:id])
    @system.links.clear
    add_links

    respond_to do |format|
      if @system.update(system_params)
        format.js { render json: @system, status: :ok }
        format.json { render json: @system, status: :ok }
      else
        format.js { render json: @system.errors, status: :unprocessable_entity }
        format.json { render json: @system.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @system = System.find(params[:id])
    respond_to do |format|
      if @system.delete
        format.js { render json: @system, status: :ok }
        format.json { render json: @system, status: :ok }
      else
        format.js { render json: @system.errors, status: :unprocessable_entity }
        format.json { render json: @system.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def system_params
      params.permit(:id, :name, :details, :visible)
    end

    def add_links
      unless params['links'].nil?
        params['links'].each do |l|
          link = Link.find(l['link']['id'])
          unless @system.links.include?(link)
            @system.links << link
          end
        end
      end
    end

end