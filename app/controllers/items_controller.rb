class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  #商品一覧表示機能の実装の際にindexアクションに.order("created_at DESC")をつける
  def index
    @items = Item.new
  end
  
  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :explanation, :price, :category_id, :status_id, :burden_id, :prefecture_id, :delivery_day_id, :image).merge(user_id: current_user.id)
  end
end
