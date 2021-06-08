class GroceryListsController < ApplicationController
  def index
    @grocery_lists = current_user.grocery_lists
  end

  def show
    @grocery_list = GroceryList.find(params[:id])
  end

  def new
    @grocery_list = GroceryList.new
  end

  def create
    @grocery_list = current_user.grocery_lists.build(grocery_list_params)
    # @grocery_list.product = Product.find(params[:grocery_list][:product_id])
    if @grocery_list.save
      redirect_to grocery_lists_path, notice: "Created successfully"
    else
      render :new
    end
  end

  def edit
    @grocery_list = GroceryList.find(params[:id])
  end

  def update
    @grocery_list = GroceryList.find(params[:id])
    @grocery_list.update(grocery_list_params)
    if @grocery_list.save
      redirect_to grocery_lists_path
    else
      render :edit, notice:'Edited successfully'
    end
  end

  def destroy
    @grocery_list = GroceryList.find(params[:id])
    @grocery_list.destroy
    redirect_to grocery_lists_path(current_user), notice: 'List deleted'
  end

  private
  def grocery_list_params
    params.require(:grocery_list).permit(:name, :date, :product_id, :quantity, :category_id)
  end

end
