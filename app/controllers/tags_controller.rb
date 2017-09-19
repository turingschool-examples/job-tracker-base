class TagsController < ApplicationController

  def new
    @job = Job.find(params[:job_id])
    @tag = Tag.new
  end

  def create
    @job = Job.find(params[:job_id])
    @tag = @job.tags.new(tag_params)
    if @tag.save
      binding.pry
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:title, :job_id)
  end
end
