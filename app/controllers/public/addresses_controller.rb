class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @address = Address.new
    @addresses = Address.all
  end
  
  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash.now[:notice] = '登録が完了しました。'
      redirect_to public_addresses_path
    else
      @addresses = current_customer.addresses
      flash.now[:notice] = '配送先の登録に失敗しました。入力内容を確認してください。'
      render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    @address.customer_id = current_customer.id
    if @address.update(address_params)
      redirect_to public_addresses_path
    else
      render :edit
    end
  end
  
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to public_addresses_path
  end
  
  private

def address_params
  params.require(:address).permit(:post_code, :address, :name)
end

end
