class Answercomment < ActiveRecord::Base
	belongs_to :answer, counter_cache: true
	belongs_to :user

	validates :body, :presence => true
end
