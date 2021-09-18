class JobApplicationMailer < ApplicationMailer
  default from: 'jobs_finder@applications.com'

  def email_applicant(user, job)
    @full_name = user.full_name
    @email = user.email
    @company_name = job.company_name
    @title = job.title

    mail(to: @email,
         subject: "Successfully applied to #{@title} position @ #{@company_name}")
  end

  def email_company(user, job)
    @full_name = user.full_name
    @email = user.email
    @company_name = job.company_name
    @title = job.title
    @company_email = job.company_email

    mail(to: @company_email,
         subject: "New application for #{@title} position @ #{@company_name}")
  end
end
