class ProductsController < ApplicationController

  def index
    @product = Product.new
    @products = Product.all
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to @product
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path, notice: 'El producto ha sido eliminado con éxito!'
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to root_path, notice: 'El producto ha sido actualizado con éxito!'
  end

  def set_favourite
    @product = Product.find(params[:id])
    @product.favourite = true
    @product.save
    redirect_to @product
  end

  def favourites
    @products = Product.where(favourite: true)
  end
  

  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :image)
  end
  

end
