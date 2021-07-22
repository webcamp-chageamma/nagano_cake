class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end
  
  def update
   @customer = current_customer
   @customer.update(customer_params)
   redirect_to customer_path
  end

  def withdrawal
    @customer = current_customer
  end
  
  def hide
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
  private
  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :phone_number, :address, :is_deleted)
  end
end
