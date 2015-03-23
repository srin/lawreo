class CreateAnswercomments < ActiveRecord::Migration
  def change
    create_table :answercomments do |t|
      t.text :body
      t.integer :answer_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
