class QuestionsController < ApplicationController

  before_action :set_question, only: [:show, :edit, :update, :destroy]
    has_scope :recent, :type => :boolean
    has_scope :unanswered, :type => :boolean
    has_scope :popular, :type => :boolean


  # GET /questions
  # GET /questions.json
  def index
    
    q = params[:q]
    @questions = Question.search(description_or_title_or_answers_body_cont: q).result.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
     
    
    end

    def search
    q = params[:q]
    @questions = Question.search(description_or_title_or_answers_body_cont: q).result.order("created_at DESC").to_a.uniq
    @heading = "Search"
    end

  def show_all
    @questions = apply_scopes(Question).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    @heading = "View all"
    end

    def commercial
    @questions = (Question).where(category_id: 1).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    @heading = "Commercial"
    end

    def ip
    @questions = apply_scopes(Question).where(category_id: 2).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    @heading = "Intellectual Property"
    end

  def employment
    @questions = apply_scopes(Question).where(category_id: 3).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    @heading = "Employment"
  end

  def real_estate
    @questions = apply_scopes(Question).where(category_id: 4).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    @heading = "Real Estate"
  end

  def venture_cap
    @questions = apply_scopes(Question).where(category_id: 5).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    @heading = "Venture capital"
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = current_user.questions.build
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = current_user.questions.build(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :description, :user_id, :category_id, :tally)
    end
end
