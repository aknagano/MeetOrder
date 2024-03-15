class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @cart_items = CartItem.all
    @sum = 0
    
    if @cart_items.empty?
      @empty_cart = true
    else
      @empty_cart = false
    end
  end
  
  def create
    # 数量が選択されているかどうかのチェック
    if params[:cart_item][:amount].blank?
      flash[:notice] = '数量を選択してください。'  
      redirect_to item_path(params[:cart_item][:item_id]) and return
    end
  
    cart_item = CartItem.new(cart_item_params)
    cart_item.customer_id = current_customer.id
    cart_item.item_id = cart_item_params[:item_id]
    if CartItem.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.update(amount: cart_item.amount)
      redirect_to public_cart_items_path
    else
      cart_item.save
      redirect_to public_cart_items_path
    end
  end
  
  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end
  
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :customer_id)
  end
end
