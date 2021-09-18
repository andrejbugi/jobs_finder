class AddJobOnApplications < ActiveRecord::Migration[6.0]
  def change
    add_reference :job_applications, :job, foreign_key: true, type: :string, limit: 36, null: false
  end
end
