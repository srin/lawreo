class AnswercommentsController < ApplicationController
  before_action :set_answercomment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /answercomments
  # GET /answercomments.json
  def index
    @answercomments = Answercomment.all
  end

  # GET /answercomments/1
  # GET /answercomments/1.json
  def show
  end

  # GET /answercomments/new
  def new
    @answer = Answer.find(params[:answer_id])
    @answercomment = @answer.answercomments.new
  end

  # GET /answercomments/1/edit
  def edit
  end

  # POST /answercomments
  # POST /answercomments.json
  def create
    @answer = Answer.find(params[:answer_id])
    @answercomment = @answer.answercomments.new(answercomment_params)
    @answercomment.user = current_user
    @question = @answer.question

    respond_to do |format|
      if @answercomment.save
        format.html { redirect_to :back, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @answercomment }
        AnswerMailer.answercomment_answerconfirm(@answer, @answercomment).deliver_now
        AnswerMailer.answercomment_userconfirm(@question).deliver_now
      else
        format.html { render :new }
        format.json { render json: @answercomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answercomments/1
  # PATCH/PUT /answercomments/1.json
  def update
    respond_to do |format|
      if @answercomment.update(answercomment_params)
        format.html { redirect_to @answercomment, notice: 'Answercomment was successfully updated.' }
        format.json { render :show, status: :ok, location: @answercomment }
      else
        format.html { render :edit }
        format.json { render json: @answercomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answercomments/1
  # DELETE /answercomments/1.json
  def destroy
    @answercomment.destroy
    respond_to do |format|
      format.html { redirect_to answercomments_url, notice: 'Answercomment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answercomment
      @answercomment = Answercomment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answercomment_params
      params.require(:answercomment).permit(:body, :answer_id, :user_id)
    end
end
