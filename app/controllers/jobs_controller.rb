class JobsController < ApplicationController

  def index
    @jobs = Job.all
    render :index
  end

  def show
    @job = Job.find(params[:id])
    render :show
  end

  def create
    @job = Job.new(
      title: params[:title],
      location: params[:location],
      salary: params[:salary]
    )
    
    if @job.save
      render :show, status: :created
    else
      render json: { errors: @job.errors }, status: :unprocessable_entity
    end
  end

  def update
    @job = Job.find(params[:id])
    @job.update(
      title: params[:title] || @job.title,
      location: params[:location] || @job.location,
      salary: params[:salary] || @job.salary
      )

      if @job.save
        render :show
      else
        render json: { errors: @job.errors }, status: :bad_request
      end
    end

  def destroy
    job = Job.find(params[:id])
    job.destroy
    render json: { message: "Job successfully deleted" }
  end


end

