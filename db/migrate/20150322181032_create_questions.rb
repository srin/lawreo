class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.integer :category_id
      t.integer :tally

      t.timestamps null: false
    end
  end
end
