class JobApplicationsController < ApplicationController
  before_action :set_job_application, only: %i[show edit update destroy]
  before_action :find_job, only: %i[index new create show]

  def index
    @job_applications = @job.job_applications
  end

  def show; end

  def new
    @job_application = @job.job_applications.build
  end

  def create
    @job_application = @job.job_applications.build(job_application_params)
    @job_application.job_id = @job.id

    if @job_application.save
      redirect_to @job
    else
      render :new
    end
  end

  def edit; end

  def update
    if @job_application.update(job_application_params)
      redirect_to @job_application
    else
      render :edit
    end
  end

  def destroy
    if @job_application.destroy
      redirect_to root_path
    else
      redirect_to @job_application
    end
  end

  private

  def job_application_params
    params.require(:job_application).permit(:full_name, :address, :phone_number,
                                            :email, :date_of_birth, :education)
  end

  def set_job_application
    @job_application = JobApplication.find(params[:id])
  end

  def find_job
    @job = Job.find(params[:job_id])
  end
end
