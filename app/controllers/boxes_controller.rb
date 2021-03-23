class BoxesController < ApplicationController
  def index
    @box = Box.all
  end

  def show
    @box = Box.find(params[:id])
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
    @box = Box.find(params[:id])
  end

  def update
    @box = Box.find(params[:id])
    if @box.update(box_params)
      redirect_to box_path(@box)
    else
      render :edit
    end
  end

  def destroy
    @box = Box.find(params:id])
    if @box.destroy
      redirect_to boxes_path
    else
      flash.alert = "Your box has not been destroy. Please try again."
    end
  end

    private

  def box_params
    params.require(:box).permit(:name, :sound, :style)
  end
end
