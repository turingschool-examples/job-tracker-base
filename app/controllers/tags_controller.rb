class TagsController < ApplicationController
  def new
    @job = Job.find(params[:job_id])
    @tag = Tag.new
  end

  def create
  end
end
