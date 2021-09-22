class AddDocumentToJobApplications < ActiveRecord::Migration[6.0]
  def change
    add_column :job_applications, :document, :string, default: ''
  end
end
