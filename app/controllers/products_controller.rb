class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
  end

  def update
    if product_params[:quantity].to_i.zero?
      @product.destroy
      redirect_to products_path, notice: 'Product was successfully removed from cart.'
    elsif @product.update(product_params)
      respond_to do |format|
        format.html { redirect_to products_path }
        format.turbo_stream
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy

    redirect_to products_path, notice: 'Product was successfully removed from cart.'
  end

  def reset
    Product.destroy_all
    redirect_to products_path, status: :see_other, notice: 'Cart was successfully reset.'
  end

  def order
    Product.destroy_all
    redirect_to products_path, notice: 'Order was successfully placed.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:quantity)
  end
end
