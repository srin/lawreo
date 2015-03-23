class AddCommentsCounterCacheToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :answercomments_count, :integer, default: 0
  end
end
