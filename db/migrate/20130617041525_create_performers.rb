class CreatePerformers < ActiveRecord::Migration
  def change
    create_table :performers do |t|
      t.integer :seatgeek_id

      t.timestamps
    end
  end
end
