class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :category
      t.string :title
      t.text :content
      t.string :area
      t.string :place
      t.datetime :date
      t.integer :payment
      t.integer :maxpeople
      t.text :image
      t.integer :user_id
      t.timestamps
    end
  end
end
