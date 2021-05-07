class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :item_sold_out, only: [:index]
  before_action :user_sold_out, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @purchase_order = PurchaseOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_order = PurchaseOrder.new(purchase_params)
    if @purchase_order.valid?
      pay_item
      @purchase_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_order).permit(:postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :token).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end



  private

  def item_sold_out 
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def user_sold_out
    @item = Item.find(params[:item_id])
    if @item.purchase.present?
      redirect_to root_path
    end
  end

end