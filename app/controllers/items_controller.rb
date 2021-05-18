class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @items = Item.all.order(created_at: 'DESC')
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to(root_path)
    else
      render(:new)
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to(item_path)
    else
      render(:edit)
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name,
                                 :product_description,
                                 :category_id,
                                 :product_status_id,
                                 :shipping_charge_id,
                                 :prefecture_id,
                                 :day_to_ship_id,
                                 :price,
                                 :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end
end
