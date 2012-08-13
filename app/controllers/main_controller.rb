class MainController < ApplicationController
  def index
  end

  def search
    redirect_to '/search/' + params[:query] and return 
  end
end
