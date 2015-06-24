class KittensController < ApplicationController
  include KittensHelper

  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.json {render :json => @kittens}
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render :json => @kitten}
    end
  end

  def new
    @kitten = Kitten.new
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def create
    @kitten = Kitten.create(kitten_params)
    flash.notice = "Kitten '#{@kitten.name}' Created!"
    redirect_to kitten_path(@kitten)
  end

  def update
    @kitten = Kitten.find(params[:id])
    @kitten.update(kitten_params)
    flash.notice = "Kitten '#{@kitten.name}' Updated!"
    redirect_to kitten_path(@kitten)
  end

  def destroy
    @kitten = Kitten.destroy(params[:id])
    flash.notice = "Kitten '#{@kitten.name}' Deleted!"
    redirect_to kittens_path
  end
end
