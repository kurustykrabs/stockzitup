class GroceryListProductsController < ApplicationController

  def index
    @grocery_list_product = GroceryListProduct.all
  end

  def create
    @grocery_list_product = @grocery_list.grocery_list_products.new(grocery_list_params)
    @grocery_list.save
    session[:grocery_list_id] = @grocery_list.id
  end

  def update
    @grocery_list_product = @grocery_list.grocery_list_products.find(params[:id])
    @grocery_list_product.update_attributes(grocery_list_params)
    @grocery_list_products = current_grocery_list.grocery_list_products
  end

  def destroy
    @grocery_list_product = @grocery_list.grocery_list_products.find(params[:id])
    @grocery_list_product.destroy
    @grocery_list_products = current_grocery_list.grocery_list_products
  end

  private

  def grocery_list_params
    params.require(:grocery_list_product).permit(:product_id, :quantity)
  end
end
