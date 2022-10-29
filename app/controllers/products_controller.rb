class ProductsController < ApplicationController

  def index
    @product = Product.all
    @product_with_most_reviews = Product.most_reviews
    @three_most_recent_products = Product.three_most_recent_products 
    @products_made_in_the_USA = Product.products_made_in_the_USA
    render :index 
  end

  def new
    @product = Product.new
    render :new
  end
 
  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to products_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  def update
    @product= Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product has been successfuly updated!"
      redirect_to products_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product and all associated reviews have been deleted."
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :cost, :country_of_origin)
  end

end