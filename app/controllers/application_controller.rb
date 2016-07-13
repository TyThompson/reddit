class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery
  # protect_from_forgery with: :exception
  # before_action :authenticate_user!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_action :authenticate_user!

  include Pundit
  # after_action :verify_authorized, :except => :index, unless: :devise_controller?
  skip_after_action :verify_authorized, only: [:index, :new, :show, :create]

  def is_admin?
    current_user.admin?
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def set_vote
    @vote = Vote.find(params[:id])
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
