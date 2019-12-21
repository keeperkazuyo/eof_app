class CreateCheers < ActiveRecord::Migration[5.2]
  def change
    create_table :cheers do |t|
      t.integer :user_id
      t.string :event_name
      t.integer :match_order
      t.string :which_cheer
      t.integer :point

      t.timestamps
    end
  end
end
