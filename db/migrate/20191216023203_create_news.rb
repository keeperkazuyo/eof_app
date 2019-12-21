class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :title
      t.text :content
      t.string :image_name
      t.integer :posting_time

      t.timestamps
    end
  end
end
