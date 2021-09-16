class JobsController < ApplicationController
  before_action :set_job, only: %i[show edit udpate destroy]

  def index
    @jobs = Job.all
  end

  def show; end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to @job
    else
      render :new
    end
  end

  def edit; end

  def update
    if @job.update(job_params)
      redirect_to @job
    else
      render :edit
    end
  end

  def destroy
    if @job.destroy
      redirect_to root_path
    else
      redirect_to @job
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :company_name,
                                :company_email, :category, :deadline,
                                :status)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end