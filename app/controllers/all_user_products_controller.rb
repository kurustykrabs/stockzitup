class AllUserProductsController < ApplicationController
  def index
    Product.joins(:grocery_lists).where(grocery_lists: {user_id: current_user.id}).distinct
  end
end
