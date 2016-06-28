class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  skip_after_action :verify_authorized, only: [:index, :new, :show, :create]

  # GET /boards
  def index
    @boards = Board.all
  end

  # GET /boards/1
  def show
    authorize @board
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit
    authorize @board
  end

  # POST /boards
  def create
    @board = Board.new(board_params)

    if @board.save
      redirect_to @board, notice: 'Board was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /boards/1
  def update
    authorize @board
    if @board.update(board_params)
      redirect_to @board, notice: 'Board was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /boards/1
  def destroy
    authorize @board
    @board.destroy
    redirect_to boards_url, notice: 'Board was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def board_params
      params.require(:board).permit(:name, :mod_id)
    end
end
