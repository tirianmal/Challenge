class CreateVideoUsers < ActiveRecord::Migration
  def change
    create_table :video_users do |t|
      t.references :video, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
