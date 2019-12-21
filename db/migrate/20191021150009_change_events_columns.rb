class ChangeEventsColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :match_order, :integer
    add_column :events, :match_class, :string
    add_column :events, :fighter_r, :string
    add_column :events, :fighter_b, :string
    add_column :events, :result, :string
    remove_column :events, :main_card, :string
  end
end
