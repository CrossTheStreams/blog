class MainController < ApplicationController
  def index
    if params[:query]

      redirect_to '/search/' + params[:query] and return
    end
  end

  def search 
    render :template => 'main/index'
  end

end
