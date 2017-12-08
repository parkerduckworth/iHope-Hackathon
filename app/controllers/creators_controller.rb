class CreatorsController < ApplicationController

  def index
    @creators = Creator.all
  end

  def new
    #@creator = current_user.creator.build
    @creator = Creator.new
  end

  def show
    @creator = Creator.find(params[:id])
  end
end
