class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    # @customers = Customer.all
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "更新に成功しました。"
      redirect_to admin_customer_path(@customer.id)
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:enterprise_name, :enterprise_name_kana, :post_code, :address, :telephone_number, :email, :is_customer_status)
  end
end
