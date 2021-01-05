class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_action, only: [:show, :edit, :update]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if not user_signed_in?
      render new_user_session_path
    elsif current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :price, :category_id, :status_id, :burden_id, :prefecture_id, :delivery_day_id, :image).merge(user_id: current_user.id)
  end

  def set_action
    @item = Item.find(params[:id])
  end
end
