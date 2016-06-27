class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]
  # skip_after_action :verify_authorized, only: [:index, :new, :show, :create]

  # GET /votes
  def index
    authorize @vote
    @votes = Vote.all
  end

  # GET /votes/1
  def show
    authorize @vote
  end

  # GET /votes/new
  def new
    authorize @vote
    @vote = Vote.new
  end

  # GET /votes/1/edit
  def edit
  end

  # POST /votes
  def create
    authorize @vote
    @vote = Vote.new(vote_params)

    if @vote.save
      redirect_to @vote, notice: 'Vote was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /votes/1
  def update
    authorize @vote
    if @vote.update(vote_params)
      redirect_to @vote, notice: 'Vote was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /votes/1
  def destroy
    authorize @vote
    @vote.destroy
    redirect_to votes_url, notice: 'Vote was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vote_params
      params.require(:vote).permit(:user_id, :value, :subject_id, :comment_id)
    end
end
