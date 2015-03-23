class AddCommentsCounterCacheToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :questioncomments_count, :integer, default: 0
  end
end
