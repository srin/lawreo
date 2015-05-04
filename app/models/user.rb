class User < ActiveRecord::Base
acts_as_voter

	has_many :questions
	has_many :answers
	has_many :questioncomments
	has_many :answercomments

  has_attached_file :image, :styles => { :medium => "200x200!>", :thumb => "100x100!>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :company, :presence => true

  def increase_karma(count=1)
    update_attribute(:karma, karma + count)
  end

  def decrease_karma(count=1)
  	update_attribute(:karma, karma - count)
  end

  after_create :user_notification

  def user_notification
    if self.is_solicitor? == true
      UserMailer.new_user_lawyer(self).deliver_now

    else
      UserMailer.new_user_nonlawyer(self).deliver_now
     end
   end

end
