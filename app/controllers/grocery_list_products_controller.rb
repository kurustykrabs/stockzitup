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
    @category = Category.find(params[:grocery_list_product][:category_id].to_i)
    @grocery_list = GroceryList.find(params[:grocery_list_product][:grocery_list_id])
      check_product_existence = @grocery_list.grocery_list_products.find_by_product_id(params[:grocery_list_product][:product_id])
      #if product already exist in the grocery list, update
      if check_product_existence
        check_product_existence.update(quantity: check_product_existence.quantity + params[:grocery_list_product][:quantity].to_i)
      else
        @grocery_list.grocery_list_products.create(grocery_list_product_params)
      end

      if @grocery_list.save || check_product_existence.save
        redirect_to category_path(@category), notice: "Added product to list" #render back on the same product page to let user choose another product to add to list
      else
        redirect_to category_path(@category), notice: "An error has occured"
      end
    end

#deletes the whole products in the grocery list including the grocery list itself
  def destroy
    @grocery_list_products = GroceryListProduct.find(params[:id])
    @grocery_list_products.destroy
      redirect_to grocery_list_path(@grocery_list), notice: 'Product deleted'
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
