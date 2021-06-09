class HomeController < ApplicationController
  def index
  end

  def show
  end
  
  skip_before_action :authenticate_user!, :only => [:index]
end
