class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_action, onlu: [:index, :create]

  def index
    @address_order = AddressOrder.new
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create
    @address_order = AddressOrder.new(order_params)
    if @address_order.valid?
      pay_item
      @address_order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:address_order).permit(:postal_code, :prefecture_id, :city, :house_number, :building_number, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_action
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
