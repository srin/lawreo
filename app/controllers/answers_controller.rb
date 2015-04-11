class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index] 
  before_action :correct_user, only: [:edit, :update, :destroy]


  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
    @answer.user = current_user
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create

    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    @answer.user = current_user

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @question, notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { redirect_to @question, notice: 'You cannot submit a blank answer, please try again.' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Answer was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def upvote
      @question = Question.find(params[:question_id])
      @answer = @question.answers.find(params[:id])
      if current_user.voted_for? @answer
        flash[:notice] = "You cannot vote more than once"
      
      else
      @answer.upvote_by current_user 
      @answer.user.increase_karma
      @answer.question.increase_tally
      flash[:success] = "You've upvoted"
      # AnswerMailer.upvote_confirm(@post, @comment.user).deliver_now  
      end
      
      redirect_to @question       
    end

  def downvote
      @question = Question.find(params[:question_id])
      @answer = @question.answers.find(params[:id])
      if current_user.voted_for? @answer
      flash[:notice] = "You cannot vote more than once"
      else
      @answer.downvote_by current_user
      @answer.user.decrease_karma
      flash[:success] = "You've downvoted"
    end
      
      redirect_to @question     
      
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def correct_user
      @answer = current_user.answers.find_by(id: params[:id])
      redirect_to questions_path, notice: "Not authorized to edit this answer" if @answer.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:body, :post_id, :user_id)
    end
end
