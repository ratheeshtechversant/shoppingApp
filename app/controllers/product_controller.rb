class ProductController < ApplicationController
  before_action :login_check ,only:[:show]

  def index
    @product = Product.all
  end
  def show
    @product =Product.find(params[:id])
  end

end
