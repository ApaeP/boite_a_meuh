class BoxesController < ApplicationController
  def index
    @box = Box.all
  end

  def new
    @box = Box.new
  end

  def create
    @box = Box.new(box_params)
    if @box.save
      redirect to boxes_path
    else
      render :new
    end
  end

  def edit
    @box = Box.find(params[:id])
  end

  def update
  end

  def show
  end

  def destroy
  end

    private

  def box_params
    params.require(:box).permit(:sound, :style)
  end
end
