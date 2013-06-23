class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.integer :posted_by
      t.string :title
      t.string :content
      t.datetime :date_posted

      t.timestamps
    end
  end
end
