class SoundsController < ApplicationController
  before_action :set_sound, only: [:edit]

  def new
    @sound = Sound.new
  end

  def edit
  end

  def index
  end

  private

  def set_sound
    @sound = Sound.find(params[:id])
  end

  def sound_params
    params.require(:sound).permit(:name, :sound_file)
  end

end
