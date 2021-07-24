class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customers = Customer.page(params[:page]).per(10)
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
     flash[:notice] = "会員情報を更新しました"
     redirect_to admin_customer_path(@customer.id)
    else
     flash[:error] = "正しい情報を入力してください"
     render action: :edit
    end
  end


  private
  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :phone_number, :address, :is_deleted)
  end
end
