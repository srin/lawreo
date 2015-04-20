class Question < ActiveRecord::Base
	has_many :answers, dependent: :destroy
	has_many :questioncomments, dependent: :destroy
	belongs_to :user, counter_cache: true
	belongs_to :category, counter_cache: true

	scope :recent, 		->{ order("created_at DESC")}
	scope :popular, 	-> { order("answers_count DESC")}
	scope :unanswered, 	-> {where(answers_count: 0)}
	# scope :category, -> category_id {where(:category_id => category_id)}

	def increase_tally(count=1) # count of upvotes for each question
    	update_attribute(:tally, tally + count)
  	end	

  	validates :title, :description, :category_id, presence: true

  	validates_acceptance_of :terms

end
