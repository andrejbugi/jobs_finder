class JobApplicationsController < ApplicationController
  before_action :set_job_application, only: %i[show edit update destroy]

  def index
    @job_applications = JobApplication.all
  end

  def show; end

  def new
    @job_application = JobApplication.new
  end

  def create
    @job_application = job_Application.new(job_application_params)

    if @job_application.save
      redirect_to @job_application
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
end
