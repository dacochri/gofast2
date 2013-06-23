class CreateJobPostings < ActiveRecord::Migration
  def change
    create_table :job_postings do |t|
      t.string :title
      t.date :post_date
      t.date :closing_date
      t.string :description
      t.string :requirements

      t.timestamps
    end
  end
end
