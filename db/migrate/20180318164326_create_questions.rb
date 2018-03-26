class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content
      t.integer :from_user_id
      t.integer :to_user_id
      t.timestamps
    end
  end
end
