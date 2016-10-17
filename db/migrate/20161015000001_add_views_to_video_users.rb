class AddViewsToVideoUsers < ActiveRecord::Migration
  def change
    add_column :video_users, :views, :integer, :default => 1
  end
end
