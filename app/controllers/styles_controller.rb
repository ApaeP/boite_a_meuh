class StylesController < ApplicationController
  before_action :set_style, only: [:edit, :update, :destroy]

  def index
    @styles = Style.all.order(created_at: "DESC")
  end

  def new
    @style = Style.new
  end

  def create
    @style = Style.new(style_params)
    if @style.save
      redirect_to root_path
      flash.notice = "Style #{@style.name} was created with success, moo!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @style.update(style_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    name = @style.name
    if @style.destroy
      redirect_to styles_path
      flash.notice = "Style #{name} has been deleted, moo!"
    else
      flash.alert = "Style #{name} couldn't be deleted"
    end
  end

  private

  def set_style
    @style = Style.find(params[:id])
  end

  def style_params
    params.require(:style).permit(:name, :pattern)
  end

end
