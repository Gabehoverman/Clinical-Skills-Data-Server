class LinksController < ApplicationController
  
  def index
    @toolbar_title = 'Links'
    @links = Link.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @links, status: :ok }
    end
  end

  def create
    @link = Link.new(link_params)
    respond_to do |format|
      if @link.save
          format.js { render json: @link, status: :ok }
          format.json { render json: @link, status: :ok }
      else
          format.js { render json: @link.errors, status: :unprocessable_entity }
          format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @link = Link.find(params[:id])
    respond_to do |format|
      if @link.update(link_params)
          format.js { render json: @link, status: :ok }
          format.json { render json: @link, status: :ok }
      else
          format.js { render json: @link.errors, status: :unprocessable_entity }
          format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @link = Link.find(params[:id])
    respond_to do |format|
      if @link.delete
        format.js { render json: @link, status: :ok }
        format.json { render json: @link, status: :ok }
      else
        format.js { render json: @link.errors, status: :unprocessable_entity }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def link_params
      params.permit(:title, :link, :visible)
    end

end