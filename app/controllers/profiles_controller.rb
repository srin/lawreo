class ProfilesController < ApplicationController
	before_action :set_user, only: [:lawyerprofile]
  before_action :authenticate_user!, only: [:myprofile]


  def myprofile

  	@user = current_user
  	@questions = @user.questions.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  	@answers = @user.answers.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    @comments = @user.questioncomments.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  def lawyerprofile
  	@answers = @user.answers.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end



    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user])
    end
end
