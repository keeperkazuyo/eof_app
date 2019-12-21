class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :event_type
      t.string :event_name
      t.datetime :event_date
      t.string :main_card
      t.string :event_place

      t.timestamps
    end
  end
end
