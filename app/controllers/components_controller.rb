class ComponentsController < ApplicationController

  def index
    @toolbar_title = 'Components'
    js :components_url => url_for(:action => :all)
  end

  def all
    @components = Component.all
    json = []

    @components.each do |component|
      json.push({
        :component => component
      })
    end

    respond_to do |format|
      format.all { render json: json, status: :ok }
    end
  end

end