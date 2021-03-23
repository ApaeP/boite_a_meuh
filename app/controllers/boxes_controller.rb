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
      redirect_to boxes_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @box.update(box_params)
      redirect_to box_path(@box)
    else
      render :edit
    end
  end

  def destroy
    if @box.destroy
      redirect_to boxes_path
    else
      flash.alert = "Your box has not been destroyed! Please try again."
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
