class TagsController < ApplicationController

  def index
    @job = Job.find(params[:job_id])
    @tags = @job.tags.all
  end

  def new
    @job = Job.find(params[:job_id])
    @tag = @job.tags.new(tag_params)
  end

  def create
    @job = Job.find(params[:job_id])
    @tag = @job.tags.new(tag_params)
    if @tag.save
      flash[:success] = "youve created a new tag"
      redirect_to job_tag_path(@job, @tag)
    else
      render :new
    end
  end

  private

  def tag_params

    params.permit(:name, :created_at, :updated_at)
  end
end
