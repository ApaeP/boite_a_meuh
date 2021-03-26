class BoxesController < ApplicationController
  before_action :set_box, only: [:show, :edit, :update, :destroy]

  def index
    @boxes = Box.all.order(created_at: 'DESC')
  end

  def show
  end

  def new
    @box = Box.new
  end

  def create
    @box = Box.new(box_params)
    if @box.save
      redirect_to boxes_path, notice: "Your MooBox #{@box.name} has been created! #{animal_talk}"
    else
      flash.alert = "We could not create this MooBox, please try again. #{animal_talk}"
      render :new
    end
  end

  def edit
  end

  def update
    if @box.update(box_params)
      redirect_to box_path(@box), notice: "Your MooBox #{@box.name} has been succesfully modified! #{animal_talk}"
    else
      flash.alert = "We are missing infos to modify your MooBox, please try again. #{animal_talk}"
      render :edit
    end
  end

  def destroy
    if @box.destroy
      redirect_to boxes_path, notice: "Your MooBox has been destroyed! #{animal_talk}"
    else
      flash.alert = "Your MooBox has not been destroyed! Please try again. #{animal_talk}"
    end
  end

  private

  def set_box
    @box = Box.find(params[:id])
  end

  def box_params
    params.require(:box).permit(:name, :size, :sound_id, :style_id)
  end
end
