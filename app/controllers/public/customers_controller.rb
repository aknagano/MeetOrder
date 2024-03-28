class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :is_matching_login_customer, only: [:edit, :update,:show]
  before_action :is_matching_guest_customer, only: [:edit, :update]
  
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
  
  def is_matching_login_customer
    customer = Customer.find(params[:id])
    customer.id == current_customer.id && customer.email != "guest@example.com"
    unless customer.id == current_customer.id
    redirect_to public_customer_path(current_customer.id)
    end
  end
  
  def is_matching_guest_customer
    @customer = Customer.find(params[:id])
    if @customer.email == "guest@example.com"
    redirect_to public_customer_path(current_customer.id)
    end
  end
  
end
