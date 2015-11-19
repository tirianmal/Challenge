class CreateBadgeUsers < ActiveRecord::Migration
  def change
    create_table :badge_users do |t|
      t.references :badge, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
