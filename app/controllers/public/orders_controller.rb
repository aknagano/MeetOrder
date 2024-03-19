class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
    @addresses = Address.all
  end
  
  def create
    @order = Order.new(order_params)
    if @order.save
      current_customer.cart_items.each do |cart_item|
        order_details = OrderDetail.new
        order_details.amount = cart_item.amount
        order_details.order_id = @order.id
        order_details.item_id = cart_item.item.id
        order_details.making_status = 0
        order_details.save
    end
    # カート内の削除
      CartItem.destroy_all
      redirect_to public_thanks_path
    else
      @addresses = Address.all # 追加
      render :new
    end
  end
  
  def index
    @orders = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
    @cart_items = current_customer.cart_items
    @order_detail = @order.order_details.all
  end
  
  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.enterprise_name
    elsif params[:order][:select_address] == "1"
       @address = Address.find(params[:order][:address_id])
       @order.post_code = @address.post_code
       @order.address = @address.address
       @order.name = @address.name
    elsif params[:order][:select_address] == "2"
      @order.customer_id = current_customer.id
    end
      @cart_items = current_customer.cart_items
      @order_new = Order.new
      render :confirm
  end
  
  def thanks
  end
  
  private

  def order_params
    params.require(:order).permit(:payment_method, :post_code, :address, :name, :shipping_cost, :total_payment, :customer_id , :order_status ,:delivery_date)
  end
  
end
