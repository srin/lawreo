class AddQuestionsCounterCacheToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :questions_count, :integer
  end
end
