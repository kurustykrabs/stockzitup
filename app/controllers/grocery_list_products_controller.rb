class GroceryListProductsController < ApplicationController

  def index
    # @grocery_list_products = GroceryListProducts.all
  end

  def show
  end

  def new
    @grocery_list_product = GroceryListProduct.new
  end

  def create
    # @grocery_list_products = GroceryListProduct.new(grocery_list_product_params)
    @grocery_list_product = @product.grocery_list_products.build(grocery_list_product_params)
    # @grocery_list_products = @grocery_list.grocery_list_products.new(grocery_list_params)
    @grocery_list_products.grocery_list = GroceryList.find(params[:grocery_list_products][:grocery_list_id])
    if @grocery_list.save
      # session[:grocery_list_id] = @grocery_list.id
      redirect_to grocery_lists_path, notice: "Added product to list" #render back on the same product page to let user choose another product to add to list
    end
  end

  private

  def grocery_list_product_params
    params.require(:grocery_list_product).permit(:product_id, :quantity, :grocery_list_id)
  end
end
