class TagsController < ApplicationController

  def new
    @tag = Tag.new(tag_params)
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:success] = "youve created a new tag"
      redirect_to 
  end




  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
