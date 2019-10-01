class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
  end

  def index
    @tags = Tag.all
  end

  def destroy
    binding.pry 
    Tag.destroy(params[:id])
    redirect_to tags_path
  end
end
