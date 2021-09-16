class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs, id: false do |t|
      t.string :id, limit: 36, primary_key: true, null: false
      t.string :title, limit: 128, null: false
      t.string :description, limit: 2024, null: false
      t.string :company_name, limit: 64, null: false
      t.string :company_email, limit: 64, null: false
      t.string :category, limit: 64, null: false
      t.integer :status, null: false, default: 1
      t.datetime :deadline, null: false

      t.timestamps
    end
  end
end
