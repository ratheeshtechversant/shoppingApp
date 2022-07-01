class CartsController < ApplicationController
  before_action :login_check
  def index
    # @cart = Cart.all
    sql = "select * from carts JOIN products ON carts.product_id = products.id
    WHERE carts.user_id = #{current_user.id}"
    @cart =  ActiveRecord::Base.connection.execute(sql)
  end
  def new
    @product =Product.find(params[:id])

  end
  def checkout
    sql = "select * from carts JOIN products ON carts.product_id = products.id
    WHERE carts.user_id = #{current_user.id}"
    @cart =  ActiveRecord::Base.connection.execute(sql)
  end

  def create
    puts params[:product_id]
    puts params[:weight]
    @product = Product.find(params[:product_id])
    puts cart_params
    @cart = @product.carts.create(cart_params)
    redirect_to root_path
  end

  private
  def cart_params
    current_user.id
    params.require(:cart).permit(:weight, :weight_type,:quantity,:user_id)
  end

end
