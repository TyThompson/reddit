class HomeController < ApplicationController
  skip_after_action :verify_authorized, only: [:index, :new, :show, :create]
  def index
  end
end
