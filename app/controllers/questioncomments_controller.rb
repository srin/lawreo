class QuestioncommentsController < ApplicationController
  before_action :set_questioncomment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /questioncomments
  # GET /questioncomments.json
  def index
    @questioncomments = Questioncomment.all
  end

  # GET /questioncomments/1
  # GET /questioncomments/1.json
  def show
  end

  # GET /questioncomments/new
  def new
    @question = Question.find(params[:question_id])
    @questioncomment = @question.questioncomments.new
    @questioncomment.user = current_user
  end

  # GET /questioncomments/1/edit
  def edit
  end

  # POST /questioncomments
  # POST /questioncomments.json
  def create
    @question = Question.find(params[:question_id])
    @questioncomment = @question.questioncomments.new(questioncomment_params)
    @questioncomment.user = current_user

    respond_to do |format|
      if @questioncomment.save
        format.html { redirect_to @question, notice: 'Comment successfully posted.' }
        format.json { render :show, status: :created, location: @questioncomment }
        
      else
        format.html { render :new }
        format.json { render json: @questioncomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questioncomments/1
  # PATCH/PUT /questioncomments/1.json
  def update
    respond_to do |format|
      if @questioncomment.update(questioncomment_params)
        format.html { redirect_to @questioncomment, notice: 'Questioncomment was successfully updated.' }
        format.json { render :show, status: :ok, location: @questioncomment }
      else
        format.html { render :edit }
        format.json { render json: @questioncomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questioncomments/1
  # DELETE /questioncomments/1.json
  def destroy
    @questioncomment.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Comment was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questioncomment
      @questioncomment = Questioncomment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def questioncomment_params
      params.require(:questioncomment).permit(:body, :question_id, :user_id)
    end
end
