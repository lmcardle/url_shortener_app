class CreateHits < ActiveRecord::Migration
  def change
    create_table :hits do |t|
      t.integer :link_id
      t.string :ip_address

      t.timestamps
    end
  end
end
