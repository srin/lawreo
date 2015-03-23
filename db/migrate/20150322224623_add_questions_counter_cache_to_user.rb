class AddQuestionsCounterCacheToUser < ActiveRecord::Migration
  def change
    add_column :users, :questions_count, :integer, default: 0
  end
end
