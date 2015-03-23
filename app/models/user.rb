class User < ActiveRecord::Base
acts_as_voter

	has_many :questions
	has_many :answers
	has_many :questioncomments
	has_many :answercomments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def increase_karma(count=1)
    update_attribute(:karma, karma + count)
  end

  def decrease_karma(count=1)
  	update_attribute(:karma, karma - count)
  end
end
