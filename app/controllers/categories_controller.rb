class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @product = @category.products
  end

  def new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: "Category created successfully"
    else
      render :new
    end
  end

    def edit
      @category = Category.find(params[:id])
    end

    def update
      @category = Category.find(params[:id])
      @category.update(category_params)
      if @category.save
        redirect_to categories_path
      else
        render :edit, notice:'Updated successfully'
      end
    end

    def destroy
      @category = Category.find(params[:id])
      @category.destroy
      redirect_to categories_path(current_user), notice: 'Category deleted'
    end

    private
    def category_params
      params.require(:category).permit(:heading, :body)
    end
end
