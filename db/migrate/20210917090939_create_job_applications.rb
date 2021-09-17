class CreateJobApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :job_applications, id: false do |t|
      t.string :id, limit: 36, primary_key: true, null: false
      t.string :full_name, limit: 128, null: false
      t.string :phone_number, limit: 16, null: false
      t.string :address, limit: 128, null: false
      t.string :email, limit: 64, null: false
      t.integer :education, null: false
      t.datetime :date_of_birth, null: false

      t.timestamps
    end
  end
end
