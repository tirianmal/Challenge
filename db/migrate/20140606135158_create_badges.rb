class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :name
      t.string :fa_symbol

      t.timestamps
    end
  end
end
