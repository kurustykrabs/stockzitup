class GroceryListProductsController < ApplicationController

  # def index
  #   @grocery_list_products = GroceryListProducts.all
  # end

  # def show
    # @grocery_list_products = GroceryListProduct.find(params[:id])
    # @grocery_list = @grocery_list_product.grocery_lists
    # gl = GroceryListProduct.find(params[:id]).grocery_list_id
    # @grocery_list_products = GroceryListProduct.where(grocery_list_id: gl)
    # @grocery_list_products = current_grocery_list.grocery_list_products
  # end

  def new
  end

  def create
    @grocery_list = GroceryList.find(params[:grocery_list_product][:grocery_list_id])
    # @grocery_list.grocery_list_products.create(grocery_list_product_params)
      check_product_existence = @grocery_list.grocery_list_products.find_by_product_id(params[:grocery_list_product][:product_id])

      if check_product_existence
        check_product_existence.update(quantity: check_product_existence.quantity + params[:grocery_list_product][:quantity].to_i)
      else
        @grocery_list.grocery_list_products.create(grocery_list_product_params)
    #if product already exist in the grocery list, update
      if @grocery_list.save
        redirect_to category_url, notice: "Added product to list" #render back on the same product page to let user choose another product to add to list
      else
        redirect_to category_url, notice: "Added product to list"
      end
    end
  end

  private

  def grocery_list_product_params
    params.require(:grocery_list_product).permit(:product_id, :quantity, :grocery_list_id, :unit_price, :total)
  end
end
# @grocery_list_products = @grocery_list.grocery_list_products.new(grocery_list_params)
# @grocery_list_products = GroceryListProduct.new(grocery_list_product_params)
# @grocery_list_products.grocery_list = GroceryList.find(params[:grocery_list_products][:grocery_list_id])
# @grocery_list_product = @product.grocery_list_products.build(grocery_list_product_params)
