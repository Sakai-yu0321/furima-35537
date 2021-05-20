class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :purchased_already, only: [:edit, :update]

  def index
    @items = Item.all.order(created_at: 'DESC')
  end

  def show
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
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to(item_path)
    else
      render(:edit)
    end
  end

  def destroy
    @item.destroy
    redirect_to(root_path)
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

  def find_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless @item.user_id == current_user.id
  end

  def purchased_already
    if @item.purchase == nil
      redirect_to root_path
    end
  end
end
