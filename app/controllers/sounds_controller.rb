class SoundsController < ApplicationController
  before_action :set_sound, only: [:edit, :update, :destroy]

  def index
    @sounds = Sound.all.order(created_at: "DESC")
  end

  def new
    @sound = Sound.new
  end

  def create
    @sound = Sound.new(sound_params)
    if @sound.save
      redirect_to root_path
      flash.notice = "Sound #{@sound.name} was created with success, moo!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @sound.update(sound_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    name = @sound.name
    if @sound.destroy
      redirect_to sounds_path
      flash.notice = "Sound #{name} has been deleted, moo!"
    else
      flash.alert = "Sound #{name} couldn't be deleted"
    end
  end

  private

  def set_sound
    @sound = Sound.find(params[:id])
  end

  def sound_params
    params.require(:sound).permit(:name, :sound_file)
  end

end
