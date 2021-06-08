class ProductsController < ApplicationController
  def index
    @products = Product.all
    @grocery_list_product = @product.grocery_list_products.build
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.category = Category.find(params[:product][:category_id])
    if @product.save
      redirect_to products_path, notice: "Product created successfully"
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end
  #
  def update
    @product = Product.find(params[:id])
    @product.category = Category.find(params[:product][:category_id])
    # @products.update(product_params)
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit, notice:'Updated successfully'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path(current_user), notice: 'Product deleted'
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :category_id, :grocery_list_id, images:[])
  end
end
