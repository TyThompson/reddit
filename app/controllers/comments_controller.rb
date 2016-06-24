class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  skip_after_action :verify_authorized, only: [:index, :new, :show, :create]

  # GET /comments
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new(subject_id: params[:subject_id], user_id: current_user.id)
  end

  # GET /comments/1/edit
  def edit
    authorize @comment
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to [@comment.subject, @comment], notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /comments/1
  def update
    authorize @comment
    if @comment.update(comment_params)
      redirect_to [@comment.subject, @comment], notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /comments/1
  def destroy
    authorize @comment
    @comment.destroy
    redirect_to subject_comments_url, notice: 'Comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:user_id, :description, :value, :subject_id)
    end
end
