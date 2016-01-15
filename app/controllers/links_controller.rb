class LinksController < ApplicationController
  
  def index
    @toolbar_title = 'Links'
    @links = Link.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @links, status: :ok }
    end
  end

  # def show

  # end

  def new
    @toolbar_title = 'New Link'
    @link = Link.new(link_params)
    # if @link.save
    #   puts 'CREATION SUCCESSFUL'
    # else
    #   puts 'CREATION FAILED'
    # end
  end

  # def create

  # end

  def edit
    @toolbar_title = 'Edit Link'
    @link = Link.find(params[:id])
    # if @link.update(link_params)
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

    def link_params
      params.permit(:title, :link, :visible)
    end

end