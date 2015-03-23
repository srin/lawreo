class Answercomment < ActiveRecord::Base
	belongs_to :answer, counter_cache: true
	belongs_to :user
end
