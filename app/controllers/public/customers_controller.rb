class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to public_customer_path(current_customer.id)
    else
      render :edit
    end
  end

  def unsubscribe
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:enterprise_name, :enterprise_name_kana, :post_code, :address, :telephone_number, :email)
  end
  
end
