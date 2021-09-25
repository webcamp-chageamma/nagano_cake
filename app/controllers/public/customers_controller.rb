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
    if @customer.update(customer_params)
     flash[:notice] = "会員情報を更新しました"
     redirect_to customer_path
    else
     flash[:error] = "正しい情報を入力してください。"
     render action: :edit
    end
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
