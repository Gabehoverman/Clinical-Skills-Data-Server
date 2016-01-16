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
    puts(params.inspect)
    # @link = Link.new(link_params)
    # if @link.save
    #   puts 'CREATION SUCCESSFUL'
    # else
    #   puts 'CREATION FAILED'
    # end
  end

  def update
    puts(params.inspect)
    # @link = Link.find(params[:id])
    # if @link.update(link_params)
    #   puts 'UPDATE SUCCESSFUL'
    # else
    #   puts 'UPDATE FAILED'
    # end
  end

  def destroy
    puts(params.inspect)
  end

  private

    def link_params
      params.permit(:title, :link, :visible)
    end

end