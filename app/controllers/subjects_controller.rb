class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  skip_after_action :verify_authorized, only: [:index, :new, :show, :create]

  # GET /subjects
  def index
    @subjects = Subject.all
  end

  # GET /subjects/1
  def show
    @board = @subject.board_id
    # @comments = @subject.comments
    # @comment = Comment.new
    # @vote = Vote.new(user_id: current_user.id, subject_id: @subject.id, value: 1)
    @subject_value = Vote.where(subject_id: @subject.id).pluck(:value).sum

  end

  # GET /subjects/new
  def new
    @subject = Subject.new
    @board = params[:board_id]
  end

  # GET /subjects/1/edit
  def edit
    authorize @subject
  end

  # POST /subjects
  def create
    @subject = Subject.new(subject_params)
    authorize @subject
    if @subject.save
      redirect_to @subject, notice: 'Subject was successfully created.'
    else
      render :new
    end
  end

  def upvote
    authorize Subject.where(id: params["subject_id"])
    @vote = Vote.new(subject_id: vote_params)
    @vote.value = 1
    vote_save
  end

  def downvote
    authorize Subject.where(id: params["subject_id"])
    @vote = Vote.new(subject_id: vote_params)
    @vote.value = -1
    vote_save
  end

  # PATCH/PUT /subjects/1
  def update
    authorize @subject
    if @subject.update(subject_params)
      redirect_to @subject, notice: 'Subject was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /subjects/1
  def destroy
    authorize @subject
    @subject.destroy
    redirect_to subjects_url, notice: 'Subject was successfully destroyed.'
  end

  def subject_creator
    @subject_creator = User.where(user_id: @subject.user_id).pluck(:email)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def subject_params
      params.require(:subject).permit(:user_id, :title, :description, :value, :board_id)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vote_params
      params.require(:subject_id)
    end

    def vote_save
      @vote.user_id = current_user.id
      if @vote.save
        redirect_to :back, notice: 'Vote was successfully created.'
      else
        redirect_to :back, alert: 'Vote was not created.'
      end
    end
end
