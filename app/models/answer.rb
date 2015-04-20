class Answer < ActiveRecord::Base
	acts_as_votable
	
	belongs_to :question, counter_cache: true
	belongs_to :user, counter_cache: true
	has_many :answercomments, dependent: :destroy

	validates :body, :presence => true
end
