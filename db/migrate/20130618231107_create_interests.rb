class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests, id: false do |t|
      t.integer :user_id
      t.integer :performer_id

      t.timestamps
    end
  end
end
