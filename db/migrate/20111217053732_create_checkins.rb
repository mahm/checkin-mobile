class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.text :message
      t.integer :place_id
      t.integer :user_id

      t.timestamps
    end
  end
end
